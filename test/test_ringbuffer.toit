import .testoiteron
import ringbuffer show *

class TestRingbuffer implements TestCase:

  run:
    test_ringbuffer_average
    test_ringbuffer_max
    test_ringbuffer_limit
    test_ringbuffer_get_last
    test_ringbuffer_std_deviation

  name -> string:
    return "TestRingbuffer"

  test_ringbuffer_average:
    ringbuffer := RingBuffer 3
    ringbuffer.append 1.0
    ringbuffer.append 2.0
    ringbuffer.append 3.0
    assertEquals 2.0 ringbuffer.average "RingBuffer average function test OK"
    ringbuffer.append 3.0
    ringbuffer.append 3.0
    assertEquals 3.0 ringbuffer.average "RingBuffer average function test OK"

  test_ringbuffer_max:
    ringbuffer := RingBuffer 5
    ringbuffer.append 1.0
    ringbuffer.append 2.0
    ringbuffer.append 3.0
    ringbuffer.append 4.0
    ringbuffer.append 5.0
    ringbuffer.append 6.0 //<-- one more then the limit
    assertTrue true "RingBuffer add more then limit max test OK"
  
  test_ringbuffer_limit:
    exception := catch:
      ringbuffer := RingBuffer -1
    assertException "RingBuffer size must be larger then 0" 

  test_ringbuffer_get_last:
    ringbuffer := RingBuffer 5
    ringbuffer.append 1.0
    last := ringbuffer.get_last
    assertEquals 1.0 last
    ringbuffer.append 2.0
    last = ringbuffer.get_last
    assertEquals 2.0 last

  test_ringbuffer_std_deviation:
    ringbuffer := RingBuffer 5
    

main:
  test := TestRingbuffer
  test.run