import os


var stack : array[0..30000, int]

let argv = commandLineParams() # ignores the file path 


let fp = readFile(argv[0])

var xpos:int = 15000
var i:int  = 0


proc BR_OPEN() =
  var op: int =1
  i+=1
  while op.bool:
    if fp[i] == '[': op+=1
    if fp[i] == ']': op-=1
    i+=1
  i+=1

proc BR_CLOSE() =
  var op: int =1
  i-=1
  while op.bool:
    if fp[i] == ']': op+=1
    if fp[i] == '[': op-=1
    i-=1

proc brain_Fug() =
  while i < fp.len:
    if fp[i] == '+':
      stack[xpos]+=1

    if fp[i] == '-':
      stack[xpos]-=1

    if fp[i] == '>':
      xpos+=1

    if fp[i] == '<':
      xpos-=1

    if fp[i] == '.':
      write(stdout,cast[char](stack[xpos]))

    if fp[i] == ',':
      discard readBuffer(stdin,stack[xpos].addr,1)

    if fp[i] == '[':
      if stack[xpos] == 0:
          BR_OPEN()
    if fp[i] == ']':
      if stack[xpos] != 0:
        BR_CLOSE()
    inc i



brain_Fug()
