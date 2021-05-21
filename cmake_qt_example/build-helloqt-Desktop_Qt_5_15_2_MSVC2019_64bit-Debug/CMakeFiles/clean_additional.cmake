# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\helloqt_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\helloqt_autogen.dir\\ParseCache.txt"
  "helloqt_autogen"
  )
endif()
