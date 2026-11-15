set(build_ninja "${RunCMake_TEST_BINARY_DIR}/build.ninja")
file(READ "${build_ninja}" build_file)
if(NOT build_file MATCHES "build hello [^\n]*\\| [^\n]*hello\\.map: C_EXECUTABLE_LINKER__hello_[^\n]*\n([^\n]+\n)*  RESTAT = 1\n")
  string(CONCAT RunCMake_TEST_FAILED "${build_ninja}\n"
    "does not declare hello.map as an output of the link edge of hello with RESTAT = 1")
endif()
