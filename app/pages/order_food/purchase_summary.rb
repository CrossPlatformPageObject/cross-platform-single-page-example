class PurchaseSummary < Page
	def initialize
		@id = PageId.new({
			                 web:   {text: 'Purchase Summary'},
			                 ios:   "",
			                 droid: "* id:'tvPurchaseSummary'"
		                 })
	end

end

PageRegistry.register_page(PurchaseSummary)
