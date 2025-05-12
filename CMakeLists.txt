cmake_minimum_required(VERSION 3.10)
project(WebChannelExample)

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_PREFIX_PATH "/opt/Qt5.15.4")

find_package(Qt5 REQUIRED COMPONENTS Core Widgets WebChannel WebEngineWidgets Test)

# Основные исходные файлы
set(SOURCES
    main.cpp
    webchannelexample.cpp
)

# Исходные файлы для тестов
set(TEST_SOURCES
    test_webchannelexample.cpp
)
set(CMAKE_AUTOMOC ON)

# Создаем исполняемый файл
add_executable(WebChannelExample ${SOURCES})
target_link_libraries(WebChannelExample Qt5::Core Qt5::Widgets Qt5::WebChannel Qt5::WebEngineWidgets)

# Добавляем ресурсы
qt5_add_resources(RESOURCES resources/resources.qrc)
target_sources(WebChannelExample PRIVATE ${RESOURCES})

# Создаем библиотеку для тестов
add_library(WebChannelExampleLib STATIC ${SOURCES})
target_link_libraries(WebChannelExampleLib Qt5::Core Qt5::Widgets Qt5::WebChannel Qt5::WebEngineWidgets)

# Добавляем тесты
enable_testing()
add_executable(TestWebChannelExample ${TEST_SOURCES})
target_link_libraries(TestWebChannelExample Qt5::Core Qt5::Test WebChannelExampleLib)
add_test(NAME TestWebChannelExample COMMAND TestWebChannelExample)