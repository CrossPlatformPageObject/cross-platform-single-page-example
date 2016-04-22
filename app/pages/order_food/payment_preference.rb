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
			                                         web:   { id: 'label_cash' },
			                                         ios:   "",
			                                         droid: "* id:'radio_cash'"
		                                         })

		@credit_radio_button = Field.radio_button({
			                                        web:   { id: 'label_credit' },
			                                        ios:   "",
			                                        droid: "* id:'radio_credit'"
		                                        })

		@submit_payment_preference = Field.transition_element({
		                            web:    {id: 'proceed'},
		                            ios:    "",
		                            droid:  "* id:'btnPaymentPreference'"
		                           },
		                           {
		                            to:  [CreditCard, PurchaseSummary]
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
