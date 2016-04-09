class FoodItemDetail < Page
  def initialize
    @id         = PageId.new({
                              web:   {text: 'Food Details'},
                              ios:   "UILabel {text CONTAINS 'Food Items'}index:0",
                              droid: "* id:'vgFoodItemDetails'"
                             })

    @add_to_cart_button = Field.element({
                                   droid: "* id:'btnAddToCart'",
                                   web: {id: 'add_to_cart'},
                                   ios: "* label marked:'Add to Cart'"
                                 })
    super('food item detail')
  end

  def add_to_cart
    @add_to_cart_button.click
    back
  end

end

PageRegistry.register_page(FoodItemDetail)
