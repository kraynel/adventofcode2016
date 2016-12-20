_ = require 'lodash'

TOTAL = 3005290
allPersons = [1..TOTAL]

current = 1
while allPersons.length > 1
  removeFirst = allPersons.length % 2 is 1

  allPersons = _.filter allPersons, (v, index) -> index % 2 is 0
  allPersons.shift() if removeFirst

console.log allPersons
