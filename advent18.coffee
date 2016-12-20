_ = require 'lodash'

FIRST_LINE = '.^^..^...^..^^.^^^.^^^.^^^^^^.^.^^^^.^^.^^^^^^.^...^......^...^^^..^^^.....^^^^^^^^^....^^...^^^^..^'
TOTAL_LINES = 400000

isTrap = (line, index) ->
  topLeft = line[index-1] or '.'
  top = line[index]
  topRight = line[index+1] or '.'

  return '^' if (
    (topLeft is '^' and top is '^' and topRight is '.') or
    (topLeft is '.' and top is '^' and topRight is '^') or
    (topLeft is '^' and top is '.' and topRight is '.') or
    (topLeft is '.' and top is '.' and topRight is '^')
  )

  '.'

previousLine = FIRST_LINE
console.log previousLine
total = _(previousLine).split('').filter((i) -> i is '.').value().length

for i in [0..TOTAL_LINES-2]
  nextLine = [0..previousLine.length-1].map (index) -> isTrap previousLine, index
  nextLine = nextLine.join('')
  console.log i
  total += _(nextLine).split('').filter((i) -> i is '.').value().length
  previousLine = nextLine


console.log total
