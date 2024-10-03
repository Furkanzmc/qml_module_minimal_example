cmake_minimum_required(VERSION 3.16)

project(
  minimal_module
  VERSION 0.1
  LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

# NOTE: Set this explicitly so that all the resources are added under
# `:/qt/qml`. This way, you don't need to worry about calling
# `engine.addImportPath()` to explicitly add the path to your module in
# `src/main.cpp`.
#
# NOTE: If you disable this policy, then you HAVE TO provide a RESOURCE_PREFIX
# in your `qt_add_qml_module` call and then add that to the import path of the
# `QQmlEngine`.
qt_policy(SET QTP0001 NEW)

qt_add_executable(minimal_module src/main.cpp)
qt_add_qml_module(minimal_module URI MinimalModuleApp QML_FILES qml/main.qml)

add_subdirectory(rectangles)

target_include_directories(minimal_module PRIVATE src/)

# NOTE: The convention is that Qt's CMake API appends `plugin` to the module
# name and sets it as a target.
target_link_libraries(minimal_module PRIVATE Qt6::Quick rectanglesplugin)
