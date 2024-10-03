qt_add_library(rectangles STATIC)

target_include_directories(rectangles PRIVATE src/)
# NOTE: Link `Qt6::QuickPrivate` because we are using `Rectangle` type in our
# QML files and the C++ equivalent of that is a private header.
target_link_libraries(rectangles PRIVATE Qt6::Quick Qt6::QuickPrivate)

qt_add_qml_module(
  rectangles
  URI
  Rectangles
  # NOTE: Explicitly add this output directory so that it ends in the same name
  # as the URI. Otherwise it causes the following warning and `qmllint` may not
  # work correctly: The rectangles target is a QML module with target path
  # Rectangles. It uses an OUTPUT_DIRECTORY of
  # /path/to/qml_module_minimal_example/build/rectangles, which should end in
  # the same target path, but doesn't. Tooling such as qmllint may not work
  # correctly.
  OUTPUT_DIRECTORY
  Rectangles
  ENABLE_TYPE_COMPILER # Optional
  QML_FILES
  qml/BlueRectangle.qml
  qml/YellowRectangle.qml
  SOURCES
  src/EmptyItem.h
  src/EmptyItem.cpp)
