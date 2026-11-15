enable_language(C)
add_executable(hello hello.c)
# A GNU-style linker writes a map file: a real byproduct of the link step.
target_link_options(hello PRIVATE "LINKER:-Map=${CMAKE_CURRENT_BINARY_DIR}/hello.map")
set_property(TARGET hello PROPERTY LINK_BYPRODUCTS hello.map)
# A step that consumes the byproduct must find a producer for it.
add_custom_command(OUTPUT hello.map.copy
  COMMAND "${CMAKE_COMMAND}" -E copy hello.map hello.map.copy
  DEPENDS "${CMAKE_CURRENT_BINARY_DIR}/hello.map")
add_custom_target(use_map ALL DEPENDS hello.map.copy)
