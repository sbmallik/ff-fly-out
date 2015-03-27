#def click_page_link(class_name)
#	@page_element = find(class_name)
#	$expected_url = @page_element[:href]
#	@page_element.click
#end

#def clear_browser_cookies
#	browser = Capybara.current_session.driver.browser
#	browser.manage.delete_all_cookies
#end

Given(/^I have cleared browser cookies$/) do
	clear_browser_cookies
end

Given(/^I am on the USCP homepage$/) do
	visit ui_url("/")
	wait_for_pageload
end

When(/^I hover on the login avatar in navigation header$/) do
	find('.site-nav-firefly-module').hover
end

Then(/^The login button displays in the user flyout$/) do
	expect(page).to have_css('.firefly-signin-btn')
end

When(/^I click the first asset in the headline grid$/) do
	within('.headline-page') do
		click_page_link(".hgpm-link-1")
	end
end

Then(/^I should see the asset page$/) do
	wait_for_pageload
	expect(current_url).to match($expected_url)
end

Then(/^I ensure that a metered asset is loaded$/) do
	while page.first('.util-bar-btn-firefly').nil? do
		unless first("iframe[name='dontmiss']").nil?
			break
		end
		step %{I click the right navigation arrow}
		step %{I should see the asset page}
	end
end	

When(/^I navigate to the next metered asset and I check for the following text:$/) do | table |
	table.hashes .each do | hsh |
		step %{I navigate to the next asset}
		step %{I should see the asset page}
		step %{I ensure that a metered asset is loaded}
		step %{I click the metered icon}
		step %{The text "#{hsh['flyout-text']}" displays in the fly-out}
	end
end

When(/^I click the metered icon$/) do
	if page.first('.util-bar-flyout-firefly-title').nil? 
		find('.util-bar-btn-firefly').click
	end
end

When(/^I click the right navigation arrow$/) do
	click_page_link(".overlay-content-arrows-next-wrap")
end

When(/^I navigate to the next asset$/) do
	if first('article.asset').nil? 
		step %{I click the first asset in the headline grid}
	else
		step %{I click the right navigation arrow}
	end
end

Then(/^The text "(.*?)" displays in the fly-out$/) do | flyout_title |
	expect(find('.util-bar-flyout-firefly-title').text).to match(flyout_title)
end

Then(/^The roadblock page displays$/) do 
	within_frame('dontmiss') do
		expect(page).to have_css('.firefly.full.trial-expired')
	end
end
