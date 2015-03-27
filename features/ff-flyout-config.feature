@ignore @uscp @fly-out
Feature: The USCP sites has a fixed number of free assets that can be viewed by an anonymous user before the roadblock page is displayed.

Scenario: Check for the fly-out if the asset is metered
	Given I am on the USCP homepage
	When I hover on the login avatar in navigation header
	Then The login button displays in the user flyout

	When I navigate to the next metered asset and I check for the following text:
| flyout-text |
| ENJOY A LIMITED NUMBER OF ARTICLES OVER THE NEXT 30 DAYS |
| 13 ARTICLES LEFT |
| 12 ARTICLES LEFT |
| 11 ARTICLES LEFT |
| 10 ARTICLES LEFT |
| 9 ARTICLES LEFT |
| 8 ARTICLES LEFT |
| 7 ARTICLES LEFT |
| 6 ARTICLES LEFT |
| 5 ARTICLES LEFT |
| 4 ARTICLES LEFT |
| 3 ARTICLES LEFT |
| 2 ARTICLES LEFT |
| 1 ARTICLE LEFT |
| THIS IS YOUR LAST ARTICLE! |

	When I click the right navigation arrow
	Then I should see the asset page
		And I ensure that a metered asset is loaded
		And The roadblock page displays
