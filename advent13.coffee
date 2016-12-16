_ = require 'lodash'
INPUT = 1350

visited = []

isOpen = (x, y) ->
  return false if x < 0 or y < 0 or visited[x]?[y] is -1
  total = x*x + 3*x + 2*x*y + y + y*y + INPUT
  base2 = (total >>> 0).toString 2
  bitsNumber = _(base2).split('').groupBy(Math.floor).value()['1'].length
  bitsNumber % 2 is 0

printMaze = (maxX, maxY) ->
  for i in [0..maxY]
    line = ''
    for j in [0..maxX]
      if isOpen i, j
        line += '.'
      else
        line += '#'

getSteps = (p) ->
  node = endOfMaze
  step = 0
  while node.parent?
    node = node.parent
    step++
  step

queue = [{x: 1, y: 1}]

findPath = (endX, endY) ->
  while queue.length > 0
    toVisit = queue.shift()
    console.log "Visiting #{toVisit.x}, #{toVisit.y}"
    return toVisit if toVisit.x is endX and toVisit.y is endY

    for p in [
      {x:toVisit.x+1, y: toVisit.y}
      {x:toVisit.x-1, y: toVisit.y}
      {x:toVisit.x, y: toVisit.y+1}
      {x:toVisit.x, y: toVisit.y-1}
    ]
      if isOpen p.x, p.y
        point = x: p.x, y: p.y, parent: toVisit
        visited[p.x] ?= []
        visited[p.x][p.y] = getSteps point
        queue.push point

endOfMaze = findPath 31, 39

console.log 'Total steps', getSteps(endOfMaze)
