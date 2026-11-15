set(rules_ninja "${RunCMake_TEST_BINARY_DIR}/CMakeFiles/rules.ninja")
file(READ "${rules_ninja}" rules)
string(REGEX MATCH "rule C_COMPILER__restat_[^\n]*\n(  [^\n]*\n)*" restat_rule "${rules}")
string(REGEX MATCH "rule C_COMPILER__plain_[^\n]*\n(  [^\n]*\n)*" plain_rule "${rules}")
if(NOT restat_rule MATCHES "\n  restat = 1\n")
  string(APPEND RunCMake_TEST_FAILED "${rules_ninja}: the C compile rule of target restat "
    "(CMAKE_C_COMPILE_OBJECT_RESTAT ON) lacks 'restat = 1':\n${restat_rule}\n")
endif()
if(plain_rule STREQUAL "")
  string(APPEND RunCMake_TEST_FAILED "${rules_ninja}: no C compile rule for target plain\n")
elseif(plain_rule MATCHES "restat")
  string(APPEND RunCMake_TEST_FAILED "${rules_ninja}: the C compile rule of target plain "
    "(variable not set) has restat:\n${plain_rule}\n")
endif()
