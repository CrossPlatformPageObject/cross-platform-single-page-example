class CreditCard < Page

	CREDIT_CARD_NUMBER = '1231231231'
	CVV_NUMBER         = '121'

	def initialize
		@id          = PageId.new({
			                          web:   { text: 'Credit Card Payment' },
			                          ios:   "",
			                          droid: "* id:'tvCredit'"
		                          })
		@credit_Card = Field.textbox({
			                             web:   { id: 'credit_card_number' },
			                             ios:   '',
			                             droid: "* id:'tvCreditCardNumber'"
		                             })
		@cvv_number  = Field.textbox({
			                             web:   { id: 'cvv_number' },
			                             ios:   '',
			                             droid: "* id:'tvCvv'"
		                             })

		@done_button = Field.transition_element({
			                                        web:   { id: 'submit_credit_card' },
			                                        ios:   "navigationButton marked:'DONE'",
			                                        droid: "* id:'btnSubmitCreditCard'"
		                                        },
		                                        {
			                                        to: PurchaseSummary
		                                        })

		super('Credit card details')
	end

	def enter_credit_card_details
		@credit_Card.enter_text CREDIT_CARD_NUMBER
		@cvv_number.enter_text CVV_NUMBER
		@done_button.click
	end

end

PageRegistry.register_page(CreditCard)
