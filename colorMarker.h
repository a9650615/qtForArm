#include <QObject>
#include <QString>

class ColorMarker : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString appName READ getAppName)

    public:
        ColorMarker(QObject *parent = nullptr);
        ~ColorMarker();
    public slots:
        void startCamera();


    private:
        QString getAppName();
};
