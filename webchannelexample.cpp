#include "webchannelexample.h"
#include <QDebug>

WebChannelExample::WebChannelExample(QObject *parent) : QObject(parent)
{
}

void WebChannelExample::receiveMessage(const QString &message)
{
    qDebug() << "Message received from JavaScript:" << message;
    // Можно отправить ответ обратно
    emit sendMessage(QString("C++ received: %1").arg(message));
}