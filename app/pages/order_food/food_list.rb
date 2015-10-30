class FoodList < Page
  def initialize
    @id         = PageId.new({
                              web:   "",
                              ios:   "* title:'Food'",
                              droid: ""
                             })
    # @done_button = Field.transition_element({
    #                             web:    "",
    #                             ios:    "",
    #                             droid:  ""
    #                            },
    #                            {
    #                             to:''
    #                            })

    super('food list page')
  end

  def order_items(order_items)
      binding.pry
  end

end

PageRegistry.register_page(FoodList)
