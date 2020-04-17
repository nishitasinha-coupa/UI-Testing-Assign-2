require 'pages/login.rb'

module LoginHelper
  def login_to_app loginName, loginPassword
    @loginpage = LoginPage::Login.new
    @loginpage.load
    @loginpage.username.set loginName
    @loginpage.password.set loginPassword
    @loginpage.login.click
  end
end