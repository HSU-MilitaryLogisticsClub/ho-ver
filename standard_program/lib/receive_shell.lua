Receive = {}
	
	function Receive.CallShell(b)
		if b==1 then
			read = os.execute([[
				#!/bin/sh
				date >> /home/pi/documents/ho-ver/standard_program/lib/hoge.txt  #動作時の日付、時刻を入力
				date +%N >> /home/pi/documents/ho-ver/standard_program/lib/hoge.txt  #動作時のナノ秒の値を返す
				python /home/pi/documents/ho-ver/standard_program/lib/hoge.py >> /home/pi/documents/ho-ver/standard_program/lib/hoge.txt  #用途で名称変更

			]])
			
		else
			read = os.execute([[
				#!/bin/sh
				date >> /home/pi/documents/ho-ver/standard_program/lib/hogehoge.txt
				date +%N >> /home/pi/documents/ho-ver/standard_program/lib/hogehoge.txt  #動作時のナノ秒の値を返す
				chmod +x /home/pi/documents/ho-ver/standard_program/lib/hoge.rb
				ruby /home/pi/documents/ho-ver/standard_program/lib/hoge.rb >> /home/pi/documents/ho-ver/standard_program/lib/hogehoge.txt 
			
			]])
		end
	end

	function Receive.ReadShell(a)
		if a==1 then
		read = os.execute([=[
					#!/bin/sh
					tail -n 1 hoge.txt
					#chmod u+x hoge.txt
					#./hoge.sh
				]=])

		else
			read = os.execute([=[
					#!/bin/sh
					tail -n 1 hogehoge.txt
					#chmod u+x hogehoge.txt    #write reading file 
					#./hoge.sh
				]=])
		end 
			print(read)
--			get = tonumber(read,10)	--"read" excange for decimal number
--			return(get)
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