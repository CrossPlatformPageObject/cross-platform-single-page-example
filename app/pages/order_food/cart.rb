class Cart < Page
  def initialize
    @id         = PageId.new({
                              web:   "",
                              ios:   "",
                              droid: "* {text CONTAINS 'Cart Items'}"
                             })

    @item = Field.element({
                            droid:"* id:'text1'",
                            ios:"",
                            web:""
                          })
    super('cart')
  end

  def get_items
    @item.text
  end
end

PageRegistry.register_page(Cart)
