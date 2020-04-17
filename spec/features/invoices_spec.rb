require 'spec_helper'
require 'site_prism'
require 'helper/login_helper.rb'
require 'helper/invoice_helper.rb'
require 'pages/welcome_page.rb'
require 'pages/invoice_page.rb'
require 'pages/create_invoice_page.rb'

feature 'Coupa Application', type: :feature do
  include LoginHelper

	include InvoiceHelper

	scenario 'Create Invoice' do
    login_to_app 'coupasupport','CoupaSupport1'
		@welcomepage = WelcomePage::Welcome.new
		@welcomepage.load
		@welcomepage.invoices.click
		@invoicepage = InvoicePage::Invoice.new
		@invoicepage.load
		@invoicepage.create_invoice.click

		createNewInvoice 'TestSupplier','test123','sample','10', "10000"

		@createinvoicepage = InvoicePage::New.new
		@createinvoicepage.invoiceLine.billing.click
		@createinvoicepage.saveInvoice.click
	end

end