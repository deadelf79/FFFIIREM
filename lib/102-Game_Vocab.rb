#
#
class Game_Vocab
	#
	def initialize
		@keywords={
			'wild_rose'	=>Game_Keyword.new('Wild Rose','The wild rose is the insignia of Kingdom of Fynn',false),
			'ring'		=>Game_Keyword.new('Ring','The wild rose is the insignia of Kingdom of Fynn',false),
		}
	end
	
	#
	def enable(keyword)
		if @keywords.include?(keyword)
			@keywords[keyword].enable=true
		end
	end
end