Receive = {}
	
	function Receive.CallShell(self,b)
		if b==1 then
			read = os.execute([[
				#!/bin/sh
				chmod +x hoge.rb
				ruby hoge.rb >> hoge.sh  #用途で名称変更
			
			]])

		else
			read = os.execute([[
				#!/bin/sh
				chmod +x hoge.py
				python hoge.py >> hogehoge.sh 
			
			]])
		end
	end

	function Receive.ReadShell(self,a)
		if a==1 then
			read = os.execute([=[
					#!/bin/sh
					tail hoge.sh
					#chmod u+x hoge.sh
					#./hoge.sh
				]=]) 

		else
			read = os.execute([=[
					#!/bin/sh
					tail hogehoge.sh
					#chmod u+x hogehoge.sh    #write reading file 
					#./hoge.sh
				]=])
		end 
--			print(read)
			get = tonumber(read,10)	--"read" excange for decimal number
			return(get)
	end

	

--Receive:ReadShell()

--Receive.new = function(name) --do not forget ""
--	local obj = {}
--	file = name .. ".sh"
--	obj.file = file

--	obj.ReadShell = function(self)
		--file = name .. ".sh"

--		os.execute([[
--				#!/bin/sh
--				chmod u+x %s
--				./%s
--				cat ${$1}|while read line
--				do
--			 	echo${line}
--				done
--			]],self.file,self.file)

--		return obj
--	end

--end
--]]
--function Receve.ReadShell(name) 