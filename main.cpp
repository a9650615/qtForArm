#include "mainwindow.h"

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QQuickView>
#include "colorMarker.h"
#include <opencv2/opencv.hpp>
#include <opencv2/videoio.hpp>

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
    // test opencv2
/*
    cv::VideoCapture _camera;
    cv::Mat _mat;
    if(_camera.open(0)) {
        qDebug() << "yes";
    } else {
        qDebug() << "no";
        _camera.release();
    }

    while (!_camera.isOpened()) {
        std::cout << "Failed to make connection to cam" << std::endl;
        _camera.release();
        _camera.open(0);
    }

    _camera.set(CV_CAP_PROP_FRAME_WIDTH, 1280);
    _camera.set(CV_CAP_PROP_FRAME_HEIGHT, 720);

    if (_camera.isOpened()) {
        printf("get camera image");
        _camera >> _mat;
        cv::imwrite("camera.jpg", _mat);
        cv::imshow("some", _mat);
        _camera.release();
    }
*/

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
