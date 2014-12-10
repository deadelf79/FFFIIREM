class Game_Map
	def initialize(filename)
		@data=[]
		if FileTest.exist?('dat/'+filename)
			_load_datas
		else
			_create_datas
		end
	end
	
	private
	
	def _load_datas
	
	end
	
	def _create_datas
		20.times{ |x|
			@data<<Array.new(15,0)
		}
	end
end