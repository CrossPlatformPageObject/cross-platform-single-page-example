class PurchaseSummary < Page
	def initialize
		@id = PageId.new({
			                 web:   "",
			                 ios:   "",
			                 droid: "* id:'tvPurchaseSummary'"
		                 })
	end

end

PageRegistry.register_page(PurchaseSummary)
