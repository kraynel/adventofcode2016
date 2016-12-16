_ = require 'lodash'

DISK_SIZE = 272

fillDisk = (input) ->
  return input.substring 0, DISK_SIZE if input.length >= DISK_SIZE

  inputCopy = _(input).split('').reverse().join ''
  inputCopy = inputCopy.replace /0/g, '-'
  inputCopy = inputCopy.replace /1/g, '0'
  inputCopy = inputCopy.replace /-/g, '1'
  console.log input
  console.log inputCopy
  fillDisk "#{input}0#{inputCopy}"

checksum = (input) ->
  mapping =
    '00': '1'
    '11': '1'
    '01': '0'
    '10': '0'
  check = _(input)
  .split ''
  .chunk 2
  .map (chunk) -> mapping[chunk.join('')]
  .join ''
  console.log check
  return checksum(check) if check.length % 2 is 0
  check

fill = fillDisk '10001001100000001'
console.log fill
console.log checksum fill
