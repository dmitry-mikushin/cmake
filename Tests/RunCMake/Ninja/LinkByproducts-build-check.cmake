if(NOT EXISTS "${RunCMake_TEST_BINARY_DIR}/hello.map.copy")
  set(RunCMake_TEST_FAILED "the consumer of the link byproduct hello.map did not run")
endif()
