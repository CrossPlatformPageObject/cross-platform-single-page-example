class FoodList < Page
  def initialize
    @id         = PageId.new({
                              web:   "",
                              ios:   "* title:'Food'",
                              droid: ""
                             })
    @done_button = Field.transition_element({
                                web:    "",
                                ios:    "",
                                droid:  ""
                               },
                               {
                                to:''
                               })

    super('food list page')
  end

  def done
    @done_button.click
  end

end

PageRegistry.register_page(FoodList)
