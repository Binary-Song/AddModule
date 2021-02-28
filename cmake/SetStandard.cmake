# Set c++ standard with force
macro(SetStandard STD) 
    message(c++${STD})
    set(CMAKE_CXX_STANDARD_REQUIRED ON ) # standard mandatory
    set(CMAKE_CXX_EXTENSIONS        OFF ) # no gnu c++
    set(CMAKE_CXX_STANDARD          ${STD}) # min standard 
endmacro()