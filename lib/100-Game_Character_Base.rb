# Базовый класс персонажа.
# Содержит все характеристики всех персонажей, является родительским по отношению к:
# * Game_Player - класс главного героя, добавлет управление игроком
# * Game_Enemy - класс противника, добавляет:
#	* трофеи при поражении
#	* иммунитет к стихиям
# * Game_Character - класс обычного персонажа (NPC), добавляет:
#	* путь движения
#	* темы диалогов
#
class Game_Character_Base
	# Создает экземпляр класса
	def initialize
		_positions
		_stats
	end
	
	# Устанавливает позицию персонажа с помощью хэш-таблицы, которая может содержать такие параметры:
	# * :direction - направление тела персонажа, может принимать значения:
	#	0 или :up - вверх
	#	1 или :right - вправо
	#	2 или :down - вниз
	#	3 или :left - влево
	# * :direction - направление головы персонажа, может принимать значения:
	#	0 или :same - то же, что и направление тела, персонаж смотрит прямо перед собой
	#	1 или :right - персонаж смотрит вправо
	#	3 или :left - персонажи смотрит влево
	# * :x, :y - позиция персонажа на карте
	def set_positions(hash)
		@direction=hash[:direction] if hash.include?(:direction)
		@head_direction=hash[:head_direction] if hash.include?(:head_direction)
		@map=hash[:map] if hash.include?(:map)
		@screen_x=hash[:screen_x] if hash.include?(:screen_x)
		@screen_y=hash[:screen_y] if hash.include?(:screen_y)
		@x=hash[:x] if hash.include?(:x)
		@y=hash[:y] if hash.include?(:y)
	end
	
	# Устанавливает все параметры персонажа. Применяется, в первую очередь,
	# при создании персонажа. Хэш-таблица может принимать такие значения:
	# 
	def set_stats(hash)
	
	end
	
	private
	
	def _positions
		@x,@y,@direction=0,0,:down
		@head_direction=:same
		@screen_x,@screen_y=0,0
		@map=1
	end
	
	def _stats
		@hp,@mp=30,5
		@pwr,@agi,@vit,@int,@soul,@def=10,10,10,10,10,0
	end
end