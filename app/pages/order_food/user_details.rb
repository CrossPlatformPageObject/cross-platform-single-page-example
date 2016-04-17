class UserDetails < Page
	def initialize
		@id = PageId.new({
			                 web:   "",
			                 ios:   "",
			                 droid: "* id:'tvUserDetails'"
		                 })

		@user_name      = Field.textbox({
			                                web:   '',
			                                ios:   '',
			                                droid: "* id:'tvName'"
		                                })
		@user_address   = Field.textbox({
			                                web:   '',
			                                ios:   '',
			                                droid: "* id:'tvAddress'"
		                                })
		@submit_details = Field.transition_element({
			                                           web:   "",
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
