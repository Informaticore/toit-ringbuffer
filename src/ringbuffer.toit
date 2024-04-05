import math

class RingBuffer:
  
  head/int := 0
  count/int := 0
  size_/int
  buffer/List

  constructor size/int:
    if size < 1: throw "RingBuffer size must be larger then 0"
    size_ = size
    buffer = List size 0.0
    
  append value/float:
    buffer[head] = value
    head = (head + 1) % size_
    count = min (count + 1) size_

  is_empty -> bool:
    return count == 0

  reduce [block]:
    if is_empty: throw "Not enough elements"
    result := null
    is_first := true
    for i := 0; i < count; i++:
      if is_first: result = buffer[i]; is_first = false
      else: result = block.call result buffer[i]
    return result

  minimum -> float:
    return reduce : | a b | min a b

  maximum -> float:
    return reduce : | a b | max a b

  average -> float:
    sum := reduce : | a b | a + b
    return sum / count

  std_deviation -> float:
    if is_empty: throw "Not enough elements"
    if count < 2:
      return 0.0 //if there is only one entry return 0.0
    avg := average
    variance := reduce : | a b | a += math.pow (b - avg) 2
    return math.sqrt variance / size_

  get_last -> float:
    return buffer[(head - 1 + size_) % size_]