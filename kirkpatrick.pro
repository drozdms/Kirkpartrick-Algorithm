TEMPLATE = app
TARGET = kirkpatrick

CONFIG += QtGui
QT += opengl
QT += widgets

OBJECTS_DIR = bin

QMAKE_CXXFLAGS = -g -std=c++11 -Wall

macx {
    QMAKE_CXXFLAGS += -stdlib=libc++  
    QMAKE_LFLAGS += -lc++
}

DEPENDPATH += src \

INCLUDEPATH += src \
               visualization/headers \
               "C:\Program Files\boost\boost_1_71_0" \

QMAKE_LFLAGS_RELEASE+=/MAP
QMAKE_CFLAGS_RELEASE += /Zi
QMAKE_LFLAGS_RELEASE +=/debug /opt:ref

HEADERS += src/graph.h \
           src/kirkpatrick.h \
           src/triangle.h \
           src/util.h \
           src/viewer.h \

SOURCES += src/graph.cpp \
           src/kirkpatrick.cpp \
           src/main.cpp \
           src/triangle.cpp \
           src/viewer.cpp \



win32:CONFIG(release, debug|release): LIBS += -L$$PWD/visualization/release/ -lgeom-visualization
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/visualization/debug/ -lgeom-visualization

INCLUDEPATH += $$PWD/visualization/debug
DEPENDPATH += $$PWD/visualization/debug
