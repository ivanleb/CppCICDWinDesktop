cmake_minimum_required(VERSION 3.2)

project(helloworld VERSION 0.0.$ENV{APPVEYOR_BUILD_NUMBER})

find_package(Boost COMPONENTS unit_test_framework REQUIRED)

configure_file(version.h.in ${PROJECT_SOURCE_DIR}/version.h)

add_executable(helloworld main.cpp)

add_library(helloworldlib lib.cpp)

add_executable(test_version test_version.cpp)

set_target_properties(helloworld helloworldlib test_version PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED ON
    COMPILE_OPTIONS "-Wpedantic;-Wall;-Wextra"
)

set_target_properties(test_version PROPERTIES
    COMPILE_DEFINITIONS BOOST_TEST_DYN_LINK
    INCLUDE_DIRECTORIES ${Boost_INCLUDE_DIR}
)

target_link_libraries(helloworld
    helloworldlib
)

target_link_libraries(test_version
    ${Boost_LIBRARIES}
    helloworldlib
)

install(TARGETS helloworld RUNTIME DESTINATION bin)

set(CPACK_GENERATOR NSIS)

set(CPACK_PACKAGE_VERSION_MAJOR "${PROJECT_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${PROJECT_VERSION_MINOR}")
set(CPACK_PACKAGE_VERSION_PATCH "${PROJECT_VERSION_PATCH}")

set(CPACK_PACKAGE_CONTACT ivan_leb@mail.ru)

include(CPack)

enable_testing()

add_test(helloworld_tests test_version)
