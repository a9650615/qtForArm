#include "colorMarker.h"
#include <QTimerEvent>
#include <QDateTime>
#include <QString>
#include <QImage>

ColorMarker::ColorMarker(QObject *parent)
    : QObject(parent)
{

}

void ColorMarker::startCamera() {
    printf("this is console");
}

QString ColorMarker::getAppName() {
    return QString::fromUtf8("這是中文字 1234");
}

ColorMarker::~ColorMarker()
{
}
