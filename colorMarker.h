#include <QObject>
#include <QString>
#include <QAbstractVideoSurface>
#include <QVideoSurfaceFormat>
#include <QQmlApplicationEngine>
#include <opencv2/core.hpp>
#include <opencv2/videoio.hpp>

class ColorMarker : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString appName READ getAppName)

    Q_PROPERTY( QAbstractVideoSurface* videoSurface READ videoSurface WRITE setVideoSurface )

    public:
        ColorMarker(QObject *parent = nullptr);
        ~ColorMarker();

        QAbstractVideoSurface* videoSurface() const;
        void setVideoSurface( QAbstractVideoSurface* s );
        void closeSurface();

        void initProcess();

    public slots:
        void startCamera();
        void timerEvent(QTimerEvent*);

    private:
        QString getAppName();
        void process();
        bool frameReady = false;

//        QQmlApplicationEngine engine;
        QVideoSurfaceFormat _format;
        QAbstractVideoSurface* _surface;
        cv::VideoCapture _camera;
        cv::Mat _mat;
};
