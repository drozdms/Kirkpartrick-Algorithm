TEMPLATE = app
TARGET = kirkpatrick

CONFIG += QtGui
QT += gui opengl
QT += widgets

OBJECTS_DIR = bin

QMAKE_CXXFLAGS = -g -std=c++17 -Wall

macx {
    QMAKE_CXXFLAGS += -stdlib=libc++  
    QMAKE_LFLAGS += -lc++
}

DEPENDPATH += src \

INCLUDEPATH += src \
               Geometry-Visualization-Library/headers \
               Geometry-Visualization-Library/src/visualization \
               Geometry-Visualization-Library/src \
               "C:\Program Files\boost\boost_1_75_0" \

HEADERS += src/graph.h \
           src/kirkpatrick.h \
           src/triangle.h \
           src/util.h \
           src/viewer.h \

SOURCES += src/graph.cpp \
           src/main.cpp \
           src/kirkpatrick.cpp \
           src/triangle.cpp \
           src/viewer.cpp \

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/Geometry-Visualization-Library/release/ -lvisualization
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/Geometry-Visualization-Library/debug/ -lvisualization


DISTFILES += \
    Geometry-Visualization-Library/.gitignore \
    Geometry-Visualization-Library/README \

SUBDIRS += \
    Geometry-Visualization-Library/geom-visualization.pro


unix|win32: LIBS += -lOpenGL32
