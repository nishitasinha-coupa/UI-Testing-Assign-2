module InvoiceSection
  class InvoiceLine < SitePrism::Section
    #element :description,"span[id$=description_field]>input"
    #element :quantity,"span[id$=quantity_field]>input"
    element :description,"input[name='invoice[invoice_lines_attributes][8][description]']"
    element :quantity, ".s-creditNoteQuantityField quantity_field_input"
    element :price, "input[name='invoice[invoice_lines_attributes][8][price]']"
    element :billing,"img[title='Choose an Account']"
  end
end