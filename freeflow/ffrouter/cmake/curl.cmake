ADD_LIBRARY(curl SHARED IMPORTED GLOBAL)
SET_PROPERTY(TARGET curl PROPERTY IMPORTED_LOCATION ${CURL_LIBRARY})
MESSAGE(STATUS "curl library: ${CURL_LIBRARY}")

INCLUDE_DIRECTORIES(${CURL_INCLUDE_DIR})