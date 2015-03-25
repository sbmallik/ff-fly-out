@ignore @uscp @fly-out
Feature: The USCP sites has a fixed number of free assets that can be viewed by an anonymous user before the roadblock page is displayed.

Scenario: Check for the fly-out if the asset is metered
	Given I have cleared browser cookies
		And I am on the homepage
	When I click the headline grid image tile "1" 
	Then I should see the asset page
		And I should see the metered icon
	When I click the metered icon 
	Then The text "ENJOY A LIMITED NUMBER OF ARTICLES OVER THE NEXT 30 DAYS" displays in the fly-out

	When I click the right navigation arrow
	Then I should see the asset page
		And I should see the metered icon
	When I click the metered icon
	Then The text "13 ARTICLES LEFT" displays in the fly-out

	When I click the right navigation arrow
	Then I should see the asset page
		And I should see the metered icon
	When I click the metered icon
	Then The text "12 ARTICLES LEFT" displays in the fly-out

	When I click the right navigation arrow
	Then I should see the asset page
		And I should see the metered icon
	When I click the metered icon
	Then The text "11 ARTICLES LEFT" displays in the fly-out

	When I click the right navigation arrow
	Then I should see the asset page
		And I should see the metered icon
	When I click the metered icon
	Then The text "10 ARTICLES LEFT" displays in the fly-out

	When I click the right navigation arrow
	Then I should see the asset page
		And I should see the metered icon
	When I click the metered icon
	Then The text "9 ARTICLES LEFT" displays in the fly-out

	When I click the right navigation arrow
	Then I should see the asset page
		And I should see the metered icon
	When I click the metered icon
	Then The text "8 ARTICLES LEFT" displays in the fly-out

	When I click the right navigation arrow
	Then I should see the asset page
		And I should see the metered icon
	When I click the metered icon
	Then The text "7 ARTICLES LEFT" displays in the fly-out

	When I click the right navigation arrow
	Then I should see the asset page
		And I should see the metered icon
	When I click the metered icon
	Then The text "6 ARTICLES LEFT" displays in the fly-out

	When I click the right navigation arrow
	Then I should see the asset page
		And I should see the metered icon
	When I click the metered icon
	Then The text "5 ARTICLES LEFT" displays in the fly-out

	When I click the right navigation arrow
	Then I should see the asset page
		And I should see the metered icon
	When I click the metered icon
	Then The text "4 ARTICLES LEFT" displays in the fly-out

	When I click the right navigation arrow
	Then I should see the asset page
		And I should see the metered icon
	When I click the metered icon
	Then The text "3 ARTICLES LEFT" displays in the fly-out

	When I click the right navigation arrow
	Then I should see the asset page
		And I should see the metered icon
	When I click the metered icon
	Then The text "2 ARTICLES LEFT" displays in the fly-out

	When I click the right navigation arrow
	Then I should see the asset page
		And I should see the metered icon
	When I click the metered icon
	Then The text "1 ARTICLE LEFT" displays in the fly-out

	When I click the right navigation arrow
	Then I should see the asset page
		And I should see the metered icon
	When I click the metered icon
	Then The text "THIS IS YOUR LAST ARTICLE!" displays in the fly-out
#	Then I should see the firefly text

	When I click the right navigation arrow
	Then I should see the asset page
		And I should see the metered icon
		And The roadblock page displays
