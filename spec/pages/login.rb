module LoginPage
	class Login < SitePrism::Page
		set_url "/sessions/new"
		element :username, 	"#user_login"
		element :password,	"#user_password"
		element :login,     "#login_button"
	end 
end
