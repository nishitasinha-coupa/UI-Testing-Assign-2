require 'pages/invoice_line.rb'
module InvoicePage
  class New < SitePrism::Page
    set_url "/invoices/new"

    element :supplier,"#invoice_supplier_search"
    element :invoiceNo, "#invoice_invoice_number"
    section :invoiceLine, ::InvoiceSection::InvoiceLine ,".s-invoiceLineTableRowRoot"
    element :saveInvoice,"#save_invoice"
  end
end