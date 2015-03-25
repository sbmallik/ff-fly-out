def click_page_link(class_name)
	@page_element = find(class_name)
	$expected_url = @page_element[:href]
	@page_element.click
end

Given(/^I have cleared browser cookies$/) do
	browser = Capybara.current_session.driver.browser
	browser.manage.delete_all_cookies
end

Given(/^I am on the homepage$/) do
	visit ui_url("/")
	wait_for_pageload
end

When(/^I click the headline grid image tile "(.*?)"$/) do | position |
	within('.headline-page') do
		click_page_link(".hgpm-link-#{position.to_s}")
	end
end

Then(/^I should see the asset page$/) do
	wait_for_pageload
	expect(current_url).to match($expected_url)
end

Then(/^I should see the metered icon$/) do
	while page.first('.util-bar-btn-firefly').nil? do
		step %{I click the right navigation arrow}
		step %{I should see the asset page}
		unless first("iframe[name='dontmiss']").nil?
			break
		end
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

Then(/^The text "(.*?)" displays in the fly-out$/) do | flyout_title |
	expect(find('.util-bar-flyout-firefly-title').text).to match(flyout_title)
end

Then(/^The roadblock page displays$/) do 
	within_frame('dontmiss') do
		expect(page).to have_css('.firefly.full.trial-expired')
	end
end
