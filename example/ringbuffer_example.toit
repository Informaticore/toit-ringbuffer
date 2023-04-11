import ringbuffer show *

main: 
  buffer := RingBuffer 32
  buffer.append 1.0
  buffer.append 2.0
  buffer.append 3.0 
  print buffer.average //prints the average value of all added values in the ringbuffer