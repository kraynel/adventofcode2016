_ = require 'lodash'
md5 = require 'md5'

SALT = 'cxdnnyjw'

computeHash = (salt) ->
  result = []
  i = 0
  while result.length < 8
    hash = md5 "#{salt}#{i}"
    console.log i if i%1000000 is 0
    if hash.startsWith '00000'
      console.log "Found! #{i} #{hash}"
      result.push
        num: i
        code: hash.substring 5, 6
    i++
  console.log _.map(result, 'code').join ''

computeHash2 = (salt) ->
  result = []
  found = 0
  i = 0
  while found < 8
    hash = md5 "#{salt}#{i}"
    console.log i if i%1000000 is 0
    if hash.startsWith '00000'
      console.log "Found! #{i} #{hash}"
      position = parseInt hash.substring 5, 6
      if position in [0..7] and not result[position]?
        console.log 'Good position'
        found++
        code = hash.substring 6, 7
        result[position] =
          num: i
          code: code
    i++
  console.log _.map(result, 'code').join ''

computeHash2 'cxdnnyjw'
