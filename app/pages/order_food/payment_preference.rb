class PaymentPreference < Page

	CASH_PAYMENT   = 'cash'
	CREDIT_PAYMENT = 'credit'

	def initialize
		@id = PageId.new({
			                 web:   { text: 'Payment Preference' },
			                 ios:   "",
			                 droid: "* id:'tvPaymentMethod'"
		                 })

		@cash_radio_button = Field.radio_button({
			                                         web:   { id: 'cash' },
			                                         ios:   "",
			                                         droid: "* id:'radio_cash'"
		                                         })

		@submit_payment_preference = Field.transition_element({
		                            web:    {id: 'proceed'},
		                            ios:    "",
		                            droid:  "* id:'btnPaymentPreference'"
		                           },
		                           {
		                            to:  PurchaseSummary
		                           })

		super('payment preference')
	end

	def pay_by_cash_and_proceed
		select_payment @cash_radio_button, CASH_PAYMENT
	end

	private
	def select_payment(element, payment_method)
		element.select payment_method
		@submit_payment_preference.click
	end

end

PageRegistry.register_page(PaymentPreference)
