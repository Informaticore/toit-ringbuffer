interface TestCase:
  run -> none
  name -> string

assertEquals expected/any actual/any msg/string="Test OK":
  result := expected == actual
  if result:
    print msg
    return
  else: 
    throw "Expected value $expected != actual value $actual" 

assertTrue actual/any msg/string="Test OK":
  result := true == actual
  if result:
    print msg
    return
  else: 
    throw "Expected value true != actual value $actual" 

assertFalse actual/any msg/string="Test OK":
  result := false == actual
  if result:
    print msg
    return
  else: 
    throw "Expected value false != actual value $actual" 

assertException exception/any msg/string="Test OK":
  if exception: 
    print msg
    return
  else: 
    throw "Expected exception was not thrown"   

run_all testcases/List:
  print "Run all test"
  testcases.do: | test_case/TestCase |
    exception := catch --trace:
      print "Test: $test_case.name"
      test_case.run
    if exception:
      print ""
      print "(╯°□°)╯︵ ┻━┻"
      print "Test Failed" 
      return
      
  print ""
  print "(｡◕‿◕｡) -ALL TESTS OKAY"