Receive = {
	ReadShell = function (self,a)

	if a==1 then
		read = os.execute([=[
				#!/bin/sh

				chmod u+x hoge.sh    #write reading file 
				./hoge.sh
			]=]) 

	else
		read = os.execute([=[
				#!/bin/sh

				chmod u+x hogehoge.sh    #write reading file 
				./hoge.sh
			]=])
	end 
--		print(read)
		get = tonumber(read,10)	--"read" excange for decimal number
		return(get)

	end
}

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