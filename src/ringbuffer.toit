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

  min value1 value2:
    if value1 < value2:
      return value1
    return value2

  average -> float:
    average := 0.0
    for i := 0; i <= count - 1; i++:
      average += buffer[i]
    return average/count

  std_deviation -> float:
    variance := 0.0
    for i := 0; i < count; i++:
      variance += math.pow (buffer[i] - average) 2
    
    return math.sqrt variance / size_

  get_last -> float:
    return buffer[head - 1]