set(QT_MIN_VERSION 5.7)
find_package(Qt5 ${QT_MIN_VERSION} CONFIG REQUIRED COMPONENTS Core Gui Network Qml Quick QuickControls2 Test)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
message(STATUS "Found Qt ${Qt5_VERSION} in ${Qt5_DIR}")

if(USE_LIBNOTIFY)
    find_package(PkgConfig)
    pkg_search_module(LIBNOTIFY QUIET libnotify)
    if (LIBNOTIFY_FOUND)
        message(STATUS "Found libnotify ${LIBNOTIFY_VERSION}")
        add_definitions(-DUSE_LIBNOTIFY)
    else ()
        message(STATUS "libnotify not found, system tray icon based notifications will be enabled")
    endif()
endif()