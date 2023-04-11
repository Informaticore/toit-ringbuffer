# ringbuffer
A RingBuffer implementation as a data structure that stores a fixed number of elements and overwrites the oldest elements once the maximum size is reached.

Usage:
```
import ringbuffer show *

main: 
  buffer := RingBuffer 32 //initialize the RingBuffer with a size of 32
  buffer.append 1.0 //append a value
  buffer.append 2.0
  buffer.append 3.0 
  print buffer.average //prints the average value of all added values in the ringbuffer in this case 2.0
```
