#ifndef WEBCHANNELEXAMPLE_H
#define WEBCHANNELEXAMPLE_H

#include <QObject>
#include <QString>

class WebChannelExample : public QObject
{
    Q_OBJECT

public:
    explicit WebChannelExample(QObject *parent = nullptr);

public slots:
    void receiveMessage(const QString &message);

signals:
    void sendMessage(const QString &message);
};

#endif // WEBCHANNELEXAMPLE_H