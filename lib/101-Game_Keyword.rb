# Класс ключевого слова.
# Содержит данные о самом слове/словосочетании, его описание и доступность.
# Подробнее об использовании смотри в классе Game_Vocab.
class Game_Keyword
	# Ключевое слово
	attr_reader :word
	# Описание для меню "Словарь"
	attr_reader :description
	# Доступность слова в данный момент игры
	attr_accessor :enable
	
	# Создает экземпляр класса
	def initialize(word,description,enable)
		@word,@description,@enable=word,description,enable
	end
	
	# Проверка доступности слова для диалога
	def enabled?
		@enable
	end
end