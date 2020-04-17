require 'capybara/rspec'
require 'webdrivers'

feature 'Coupa test', type: :feature do
	Capybara.app_host = 'http://www.newtours.demoaut.com/'
	Capybara.run_server = false
	Capybara.default_driver = :selenium_chrome

	def signIn
		fill_in 'userName', with: 'mercury'
		fill_in 'password', with: 'mercury'
		click_on('login')
	end

	def flightDetails
		find(:xpath, "//input[@value='roundtrip']").click
		select '1', from: 'passCount'
		select 'New York', from: 'fromPort'
		select 'April', from: 'fromMonth'
		select '24', from: 'fromDay'
		select 'Paris', from: 'toPort'
		select 'April', from: 'toMonth'
		select '30', from: 'toDay'

		find(:xpath, "//input[@value='Business']").click
		select 'Unified Airlines', from: 'airline'

		click_on('findFlights')
	end

	def selectFlight
		find(:xpath, '//input[@value="Unified Airlines$363$281$11:24"]').click
	  	find(:xpath, '//input[@value="Unified Airlines$633$303$18:44"]').click
	  	#find(:xpath, '//input[value*="Unified"]').click
	  	#find(:xpath, '//input[value*="Unified"]').click
		click_on('reserveFlights')
	end

	def bookFlight
		#Passenger details
		fill_in 'passFirst0', with: 'Nishita'
		fill_in 'passLast0', with: 'Sinha'
		select 'Hindu', from: 'pass.0.meal'

		#Card details
		select 'Visa', from: 'creditCard'
		fill_in 'creditnumber', with: '9999999999999999'
		select '04', from: 'cc_exp_dt_mn'
		select '2010', from: 'cc_exp_dt_yr'
		fill_in 'cc_frst_name', with: 'Nishita'
		fill_in 'cc_last_name', with: 'Sinha'

		#Billing details
		find(:xpath, '(//input[@name="ticketLess"])[1]').click
		fill_in 'billAddress1', with: '15, Brooklyn Avenue'
		fill_in 'billCity', with: 'Brooklyn'
		fill_in 'billState', with: 'NY'
		fill_in 'billZip', with: '81378'
		select 'UNITED STATES', from: 'billCountry'

		#Delivery details
		fill_in 'delAddress1', with: '15, Brooklyn Avenue'
		fill_in 'delCity', with: 'Brooklyn'
		fill_in 'delState', with: 'NY'
		fill_in 'delZip', with: '81378'
		select 'UNITED STATES', from: 'delCountry'

		click_on('buyFlights')

	end 

	scenario 'Visit Newtours' do
		visit '/'
		expect(page.title).to have_content('Mercury')
		signIn

		expect(page.title).to have_content('Find a Flight: Mercury Tours:')
		flightDetails

		expect(page.title).to have_content('Select a Flight: Mercury Tours')
		selectFlight

		expect(page.title).to have_content('Book a Flight: Mercury Tours')
		bookFlight

		expect(page.title).to have_content('Flight Confirmation: Mercury Tours')

		

	end 
end