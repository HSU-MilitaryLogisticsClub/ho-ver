Call={
	otherfile = function(self,a)

	if a==1 then
		read = os.execute([[
			#!/bin/sh
			ruby hoge.rb

			touch hoge.sh
			echo $? > hoge.sh
			]])

	else
		read = os.execute([[
			#!/bin/sh
			python hoge.py

			touch hogehoge.sh
			echo $? > hogehoge.sh
			]])
	end

	--get = tonumber(read,10)
	--return(get)

end
}