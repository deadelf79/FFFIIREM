#
class Game_Player < Game_Character_Base
	#
	def initialize
		super
	end
	
	#
	def update
		super
		user_controls
	end
	
	#
	def user_controls
		_movement
	end
	
	#
	def dispose
		super
	end
	
	private
	def _movement
		
	end
end