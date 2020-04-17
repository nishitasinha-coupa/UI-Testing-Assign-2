module WelcomePage
	class Welcome < SitePrism::Page
		set_url "/"

		element :invoices,"a[href='/invoices']"
	end
end