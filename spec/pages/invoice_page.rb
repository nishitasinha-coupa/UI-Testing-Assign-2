module InvoicePage
  class Invoice < SitePrism::Page
    set_url "/invoices"

    element :create_invoice,"a[href='/invoices/new']"
  end
end