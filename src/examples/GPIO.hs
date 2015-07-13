module GPIO where

data PinMode = IN | OUT deriving (Eq)
data Value = HIGH | LOW deriving (Eq)

type Pin = (PinNum,PinMode)
type PinNum = Int

instance Show PinMode where
  show IN  = "in"
  show OUT  = "out"

instance Show Value where
  show HIGH = "1"
  show LOW  = "0"

pinAssign :: [PinNum]
pinAssign = [0,2,3,4,5,7,14,15,20,22,23,26,27,30,31,40,44,45,46,47,48,49,51,60,61,65,66,67,68,117,122,125]
-- beaglebone

pin2Char :: PinNum -> String
pin2Char n
  | n `elem` pinAssign = show n
  | otherwise = error "No pin number, Stop ."

open :: Pin -> IO ()
open (0,_) = return ()
open (x,y) = do
  writeFile "/sys/class/gpio/export" $ pin2Char x
  writeFile ("/sys/class/gpio/gpio"++(pin2Char x)++"/direction") $ show y

close :: Pin -> IO ()
close (x,_) = writeFile "/sys/class/gpio/unexport" $ pin2Char x

closeNum :: PinNum -> IO ()
closeNum x = writeFile "/sys/class/gpio/unexport" $ pin2Char x

openArray :: [Pin] -> IO [()]
openArray ps
  | ps == [] = error "Error34"
  | otherwise = sequence $ map open ps

closeArray :: [Pin] -> IO [()]
closeArray ps
  | ps == [] = error "Error34"
  | otherwise = sequence $ map close ps

pinOut :: Pin -> Value -> IO ()
pinOut (0,_) _ = return ()
pinOut (x,y) z
  | y == OUT = writeFile ("/sys/class/gpio/gpio" ++ (pin2Char x) ++ "/value") $ show z
  | otherwise = error "output error"

pinIn :: Pin -> IO String
pinIn (x,y)
  | y == IN = readFile ("/sys/class/gpio/gpio"++(pin2Char x)++"/value")
  | otherwise = error "input error"
