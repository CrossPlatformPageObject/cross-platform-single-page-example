class FoodItemDetail < Page
  def initialize
    @id         = PageId.new({
                              web:   "",
                              ios:   "",
                              droid: "* id:'vgFoodItemDetails'"
                             })

    # @add_to_cart = Field.element({
    #                              })
    super('food item detail')
  end

  def add_to_cart
    @add_to_cart.click
    back
  end

end

PageRegistry.register_page(FoodItemDetail)
