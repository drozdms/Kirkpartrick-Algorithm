#include <QApplication>
#pragma comment( lib, "OpenGL32.lib" )
#include "viewer.h"

int main(int argc, char** argv) {
   QApplication app(argc, argv);
   kirkpatrick_viewer viewer;
   run_viewer(&viewer, "Kirkpatrick triangulation refinement");
}
