import GPIO
--import Control.Concurrent
import System.IO

pins = outpins
outpins = zip [12,16,20,21] (repeat OUT)

outPat :: (Value,Value,Value,Value) -> IO ()
outPat (a,b,c,d) = do
  pinOut (12,OUT) a
  pinOut (16,OUT) b
  pinOut (20,OUT) c
  pinOut (21,OUT) d

loopback (a,b,c,d) = do
  outPat (a,b,c,d)
  mainLoop

trans :: String -> IO ()
trans "1" = loopback (HIGH,HIGH,LOW,LOW)
trans "2" = loopback (LOW,LOW,HIGH,HIGH)
trans "3" = loopback (HIGH,LOW,LOW,HIGH)
trans "4" = loopback (LOW,HIGH,HIGH,LOW)
trans "" = outPat (LOW,LOW,LOW,LOW)
trans _ = loopback (LOW,LOW,LOW,LOW)

getData :: IO ()
getData = do
  a <- getLine
  trans a

mainLoop = do
  getData

main = do
  openArray pins
  mainLoop
  closeArray pins