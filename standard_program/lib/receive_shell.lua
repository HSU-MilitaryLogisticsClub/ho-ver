Receive = {}
	
	function Receive.WriteDate()
		os.execute([[
			#!/bin/sh

			#date >> /home/pi/doc/ho-ver/standard_program/lib/hoge.txt  #動作時の日付、時刻を入力
			date >> hoge.txt

			#date >> /home/pi/doc/ho-ver/standard_program/lib/hogehoge.txt
			date >> hogehoge.txt
			]])
	end

	function Receive.CallShell(b)
		if b==1 then
			read = os.execute([[
				#!/bin/sh

				## RaspberryPi環境用
				#date +%M:%S:%N >> /home/pi/doc/ho-ver/standard_program/lib/hoge.txt  #動作時のナノ秒の値を返す
				#python3 /home/pi/doc/ho-ver/standard_program/lib/hoge.py >> /home/pi/documents/ho-ver/standard_program/lib/hoge.txt  #用途で名称変更

				## RaspberryPi以外の環境用
				date +%M:%S:%N >> hoge.txt
				python hoge.py >> hoge.txt
			]])
			
		else
			read = os.execute([[
				#!/bin/sh

				## RaspberryPi環境用
				#date +%M:%S:%N >> /home/pi/doc/ho-ver/standard_program/lib/hogehoge.txt  #動作時のナノ秒の値を返す
				#chmod +x /home/pi/doc/ho-ver/standard_program/lib/hoge.rb  		   #hoge.rbに実行権限を付与する
				#ruby /home/pi/doc/ho-ver/standard_program/lib/hoge.rb >> /home/pi/documents/ho-ver/standard_program/lib/hogehoge.txt 
				
				## RaspberryPi以外の環境用
				date +%M:%S:%N >> hogehoge.txt 
				chmod +x hoge.rb
				ruby hoge.rb >> hogehoge.txt
			]])
		end
	end

	function Receive.ReadShell()
		local hoge = io.open("hoge.txt","r")
		line = {}
		loop = 1
		--local len = hoge:seek("end")
		--hoge:seek("set",len-2)
		--local num = hoge:read("*a")
		
		for i in hoge:lines() do
			line[loop] = i
			loop = loop+1
		end

		hoge:close()

		num = tonumber(line[loop-1])
		return num
		
		
--[[		if a==1 then

		read = os.execute([=[
					#!/bin/sh
					tail -n 1 hoge.txt	#ファイル最終行を読む
				]=])
		read = tonumber(read)

		else
			read = os.execute([=[
					#!/bin/sh
					
				]=])
		end 
			print(read) ]]
--			get = tonumber(read,10)	--"read" excange for decimal number
--			return(get) 
	end 

