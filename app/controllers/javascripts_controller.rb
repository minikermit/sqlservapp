class JavascriptsController < ApplicationController

	def dynamic_entities
	@entities = Entity.all
		
	end

end
