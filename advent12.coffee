_ = require 'lodash'

instructions = [
  'cpy 1 a'
  'cpy 1 b'
  'cpy 26 d'
  'jnz c 2'
  'jnz 1 5'
  'cpy 7 c'
  'inc d'
  'dec c'
  'jnz c -2'
  'cpy a c'
  'inc a'
  'dec b'
  'jnz b -2'
  'cpy c b'
  'dec d'
  'jnz d -6'
  'cpy 19 c'
  'cpy 11 d'
  'inc a'
  'dec d'
  'jnz d -2'
  'dec c'
  'jnz c -5'
]

sp = 0
registers = a: 0, b: 0, c: 1, d: 0

cpy = (left, right) ->
  if /[0-9]+/.test left
    registers[right] = parseInt left
  else
    registers[right] = registers[left]

inc = (left) ->
  registers[left] += 1
dec = (left) ->
  registers[left] -= 1

jnz = (left, right) ->
  if /[0-9]+/.test left
    value = parseInt left
  else
    value = registers[left]

  if /[0-9]+/.test right
    jmp = parseInt right
  else
    jmp = registers[right]

  if value is 0
    sp++
  else
    sp += jmp

while sp < instructions.length
  nextInstruction = instructions[sp].split ' '
  switch nextInstruction[0]
    when 'cpy'
      cpy nextInstruction[1], nextInstruction[2]
      sp++
    when 'inc'
      inc nextInstruction[1]
      sp++
    when 'dec'
      dec nextInstruction[1]
      sp++
    when 'jnz'
      jnz nextInstruction[1], nextInstruction[2]

console.log registers
