#
# https://doc.qt.io/qt-5/cmake-get-started.html
#
cmake_minimum_required(VERSION 3.20)

project(cmake_qt_automoc_example VERSION 0.0)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# Qt5_DIR should be set (in the CMake cache) to location of "Qt5Config.cmake" file
set(Qt5_DIR "C:/Qt/5.15.2/msvc2019_64/lib/cmake/Qt5")
find_package(Qt5 COMPONENTS Widgets REQUIRED)

message(STATUS "-vv- Qt5Widgets_FOUND          : ${Qt5Widgets_FOUND}"         )
message(STATUS "-vv- Qt5Widgets_VERSION_STRING : ${Qt5Widgets_VERSION_STRING}")
message(STATUS "-vv- Qt5Widgets_INCLUDE_DIRS   : ${Qt5Widgets_INCLUDE_DIRS}"  )
message(STATUS "-vv- Qt5Widgets_LIBRARIES      : ${Qt5Widgets_LIBRARIES}"     )

add_executable(cmake_qt_automoc_example
    mainwindow.ui
    mainwindow.cpp
    main.cpp
    #resources.qrc
)

target_link_libraries(cmake_qt_automoc_example Qt5::Widgets)