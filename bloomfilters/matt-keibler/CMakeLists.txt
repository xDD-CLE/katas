cmake_minimum_required(VERSION 2.8)
project(in_bloom)

set(CMAKE_CXX_FLAGS "-std=c++14")

find_package(GTest REQUIRED)

add_executable(unit_test
	src/BloomFilter.cpp
	src/HashCalculator.cpp
	src/WordFileReader.cpp
	test/BloomFilterTest.cpp
	test/HashCalculatorTest.cpp
	test/MockHashCalculator.cpp)

add_executable(bloom_filter
	src/main.cpp
	src/BloomFilter.cpp
	src/HashCalculator.cpp
	src/WordFileReader.cpp)

include_directories($(GTEST_INCLUDE_DIR))
target_link_libraries(unit_test gtest gtest_main)
