class UserDetails < Page
	def initialize
		@id = PageId.new({
			                 web:   { text: 'Enter User details:' },
			                 ios:   "",
			                 droid: "* id:'tvUserDetails'"
		                 })

		@user_name      = Field.textbox({
			                                web:   { id: 'name' },
			                                ios:   '',
			                                droid: "* id:'tvName'"
		                                })
		@user_address   = Field.textbox({
			                                web:   { id: 'address' },
			                                ios:   '',
			                                droid: "* id:'tvAddress'"
		                                })
		@submit_details = Field.transition_element({
			                                           web:   { id: 'payment_button' },
			                                           ios:   "",
			                                           droid: "* id:'btnProceed'"
		                                           },
		                                           {
			                                           to: PaymentPreference
		                                           })

		super('user details')
	end

	def submit_user_details(user_name, user_address)
		@user_name.enter_text user_name
		@user_address.enter_text user_address
		@submit_details.click
	end

end

PageRegistry.register_page(UserDetails)
