class PaymentPreference < Page

	def initialize
		@id = PageId.new({
			                 web:   { text: 'Payment Preference' },
			                 ios:   "UIButton marked:'Proceed'",
			                 droid: "* id:'tvPaymentMethod'"
		                 })

		@cash_radio_button = Field.radio_button({
			                                        web:   { id: 'label_cash' },
			                                        ios:   "UILabel marked:'Cash On delivery'",
			                                        droid: "* id:'radio_cash'"
		                                        })

		@credit_radio_button = Field.radio_button({
			                                          web:   { id: 'label_credit' },
			                                          ios:   "",
			                                          droid: "* id:'radio_credit'"
		                                          })

		@submit_payment_preference = Field.transition_element({
			                                                      web:   { id: 'proceed' },
			                                                      ios:   "UIButton marked:'Proceed'",
			                                                      droid: "* id:'btnPaymentPreference'"
		                                                      },
		                                                      {
			                                                      to: [CreditCard, PurchaseSummary]
		                                                      })

		super('payment preference')
	end

	def pay_by_cash_and_proceed
		select_payment @cash_radio_button
	end

	def select_pay_by_credit
		select_payment @credit_radio_button
	end

	private
	def select_payment(element)
		element.select
		@submit_payment_preference.click
	end

end

PageRegistry.register_page(PaymentPreference)
