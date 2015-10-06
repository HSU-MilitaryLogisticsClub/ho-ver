Write={}

function Write.text(self,num)
	t = io.open(string.format("%f\n",num),"a+")
	--t:write(string.format("%f\n",num))
	t:close()
end

