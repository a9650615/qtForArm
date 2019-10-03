#include "colorMarker.h"
#include <QTimerEvent>
#include <QDateTime>
#include <QString>
#include <QAbstractVideoSurface>
#include <QVideoSurfaceFormat>
#include <QDebug>
#include <QtConcurrent/QtConcurrent>
#include <opencv2/opencv.hpp>
#include <opencv2/videoio.hpp>

using namespace cv;

int width = 200;
int height = 100;

ColorMarker::ColorMarker(QObject *parent)
    : QObject(parent) ,
      _surface(nullptr)
{

//    width = engine.rootObjects()[0]->property("width").toInt();
//    height = engine.rootObjects()[0]->property("height").toInt();
//    cv::VideoCapture camera;

    startTimer(1000/30);
    startCamera();
    initProcess();
}

void ColorMarker::initProcess() {
    QtConcurrent::run(this, &ColorMarker::process);
//    process();
}

void ColorMarker::startCamera() {
    printf("this is console");
    if(_camera.open(0)) {
        qDebug() << "yes";
    } else {
        qDebug() << "no";
    }

    while (!_camera.isOpened()) {
        std::cout << "Failed to make connection to cam" << std::endl;
        _camera.open(0);
    }

//    process();
//    _camera >> _mat;
}

void ColorMarker::setVideoSurface( QAbstractVideoSurface* s )
{
//    closeSurface();
    _surface = s;
}

QAbstractVideoSurface* ColorMarker::videoSurface() const
{
    return _surface;
}

QString ColorMarker::getAppName() {
    return QString::fromUtf8("這是中文字 1234");
}

void ColorMarker::process() {
    while(_camera.isOpened()) {
        frameReady = true;
        _camera >> _mat;
//        qDebug() << "process";
    }
//    while (_camera.isOpened()) {
//        _camera >> _mat;
//    }
//    if(!frameReady && !_mat.empty()){
//        cv::Mat outMat =  cv::Mat(10, 10, 1);
//        qDebug() << "!!!! = " << outMat.data;
//        _mat = outMat;
//        frameReady = true;
//    }
}

void ColorMarker::timerEvent(QTimerEvent*)
{
    if (!_surface) return;

//        if(frameReady)
//        qDebug() << "ddd = " << _mat.data;

        if(frameReady && !_mat.empty())
        {

            cv::Mat outMat;
            cv::cvtColor(_mat, outMat, cv::COLOR_BGR2BGRA);

            QImage screenImage((uchar*)outMat.data, outMat.cols, outMat.rows, outMat.step, QImage::Format_RGB32);

            if(QSize(width, height) != _format.frameSize())
            {
                qDebug() << "newSize";
                closeSurface();
                _format = QVideoSurfaceFormat( QSize(width, height), QVideoFrame::PixelFormat::Format_RGB32);
                _surface->start(_format);
            }

            _surface->present( QVideoFrame( screenImage ) );

            frameReady = false;
        }
}

void ColorMarker::closeSurface() {
    if (_surface && _surface->isActive()) {
        _surface->stop();
    }
}

ColorMarker::~ColorMarker()
{
    closeSurface();
}
