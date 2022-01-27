cmake_minimum_required(VERSION 3.16)

project(QTQML1 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Core REQUIRED)
find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)
find_package(Qt6 6.2 COMPONENTS QuickControls2 REQUIRED)

qt_add_executable(MouseMonitor
    main.cpp
    mousememory.h
    mousememory.cpp
)

qt_add_qml_module(MouseMonitor
    URI QTQML1
    VERSION 1.0
    QML_FILES main.qml 
)

set_target_properties(MouseMonitor PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_compile_definitions(MouseMonitor
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(MouseMonitor
    PRIVATE Qt6::Core Qt6::Quick Qt6::QuickControls2)
