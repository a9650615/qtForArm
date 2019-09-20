#include "mainwindow.h"

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "colorMarker.h"


int main(int argc, char *argv[])
{
//    QApplication a(argc, argv);
//    MainWindow w;
//    w.show();
//    return a.exec();

    QApplication app(argc, argv);

    // load custom c++ module
    qmlRegisterType<ColorMarker>("io.qt.colormarker", 1, 0, "ColorMarker");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("main.qml")));


    return app.exec();
}
