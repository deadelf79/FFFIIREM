class IniFile
	attr_reader :branches
	attr_reader :values
	def initialize(filename)
		@branches=[]
		@values={}
		if FileTest.exists?(filename)
			@filename=filename
			read_branches
			read_values
		else
			false
		end
	end
	
	def read_branches
		file=open(@filename,'r')
		lines=file.readlines
		lines.each{|line|
			@branches<<line if line[/\[(\w)+\]/]
			@branches.last.gsub!(/[\[\n\]]/){''}
		}
		file.close
	end
	
	def read_values
		@branches.each{|branch|
			@values[branch]={}
		}
		file=open(@filename,'r')
		lines=file.readlines
		current=''
		lines.each{|line|
			br=line[/\[(\w)+\]/]
			br.gsub!(/[\[\]]/){''} if br!=nil
			if br
				current=br
				next
			end
			item=line[/(\w)+/]
			# может неправильно прочитать файл, если в конце
			# последней используемой строки нет \n
			# поэтому и приблавляем на всякий случай
			line+="\n"
			value=line.match(/\=([\w\d\/\\\.\s]+)/)[1]
			@values[current][item]=value.gsub!("\n"){''}
		}
		file.close
	end
	
	def change_value(branch,value,property)
		if @values.include?(branch)
			if @values[branch].include?(value)
				@values[branch][value]=property
			end
		end
		save_values
	end
	
	def save_values
		file=open('bk'+@filename,'w')
		@branches.each{|branch|
			file.write("[#{branch}]\n")
			@values[branch].each{|key,value|
				file.write("#{key}=#{value}\n")
			}
		}
		file.close
	end
end

begin
	Dir.chdir("C:\\Users\\user\\YandexDisk\\Source\\FFFIIREM\\")
	ini=IniFile.new('Game.ini')
	if ini!=false then
		ini.change_value('Volume','Sound','10')
		puts ini.values
	end
end