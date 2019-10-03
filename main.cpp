#include "mainwindow.h"

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QQuickView>
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
//    QQuickView view;

//    view.resize(500, 500);
//    view.setResizeMode(QQuickView::SizeRootObjectToView);
//    view.setSource(QUrl("qrc:/main.qml"));
//    view.show();
//    ColorMarker colorMaker;
//    colorMaker.initProcess();


    return app.exec();
}
