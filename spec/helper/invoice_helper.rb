require 'pages/create_invoice_page.rb'
require 'pages/invoice_line.rb'
module InvoiceHelper

  def createNewInvoice supplier,invoiceNo,description,quantity, price

    @invoicepage = InvoicePage::New.new
    @invoicepage.supplier.set supplier
    @invoicepage.invoiceNo.set invoiceNo
    @invoicepage.invoiceLine.description.set description
    @invoicepage.invoiceLine.quantity.set quantity
    @invoicepage.invoiceLine.price.set price


  end
end