enable_language(C)
add_library(plain STATIC greeting.c)
# CMAKE_<LANG>_COMPILE_OBJECT_RESTAT is read from the directory of the target.
add_subdirectory(CompileObjectRestat)
