Receive={}

function Receive.read(self,di)
	r = io.open(string.format("%s",di).."sh","r")
	get = tonumber(read,10)	--"read" excange for decimal number
	return(get)
end
