class Entry < ApplicationRecord
	after_initialize :set_default
	def set_default
		self.friend ||= 0;
		puts "Entry.friend initializer Running......................."
	end
end
