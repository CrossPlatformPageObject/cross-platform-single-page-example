class Field

	def self.transition_element(id_map, transition_map)
		TransitionElement.new(id_map, transition_map)
	end

	def self.element(id_map)
		Element.new(id_map)
	end

	def self.textbox(id_map)
		Textbox.new(id_map)
	end

	def self.radio_button(id_map)
		RadioButton.new(id_map)
	end

end
