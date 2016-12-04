dirs = [{x:-1, y:0}, {x:0, y:+1}, {x:+1, y:0}, {x:0, y:-1}]
compute = (input) ->
  pos = []
  directions = input.split ', '
  cdir = 0
  x=0
  y=0
  for direction in directions
    if direction[0] is 'R'
      cdir++
    else
      cdir--

    console.log(parseInt(direction[1]));
    cdir = ((cdir+4)%4)%4;
    steps = parseInt direction.substring(1)

    for i in [0..steps-1]
      x += dirs[cdir].x
      y += dirs[cdir].y
      key = x*100000 + y;
      if pos.indexOf(key) >= 0
        console.log("STOP AT", x, y)
        return x:x, y:y
      else
        pos.push key

  x:x, y:y


{x, y} = compute "R1, L3, R5, R5, R5, L4, R5, R1, R2, L1, L1, R5, R1, L3, L5, L2, R4, L1, R4, R5, L3, R5, L1, R3, L5, R1, L2, R1, L5, L1, R1, R4, R1, L1, L3, R3, R5, L3, R4, L4, R5, L5, L1, L2, R4, R3, R3, L185, R3, R4, L5, L4, R48, R1, R2, L1, R1, L4, L4, R77, R5, L2, R192, R2, R5, L4, L5, L3, R2, L4, R1, L5, R5, R4, R1, R2, L3, R4, R4, L2, L4, L3, R5, R4, L2, L1, L3, R1, R5, R5, R2, L5, L2, L3, L4, R2, R1, L4, L1, R1, R5, R3, R3, R4, L1, L4, R1, L2, R3, L3, L2, L1, L2, L2, L1, L2, R3, R1, L4, R1, L1, L4, R1, L2, L5, R3, L5, L2, L2, L3, R1, L4, R1, R1, R2, L1, L4, L4, R2, R2, R2, R2, R5, R1, L1, L4, L5, R2, R4, L3, L5, R2, R3, L4, L1, R2, R3, R5, L2, L3, R3, R1, R3"
# {x, y} = compute "R8, R4, R4, R8"

console.log 'x', x
console.log 'y', y
console.log 'total', Math.abs(x) + Math.abs(y)
