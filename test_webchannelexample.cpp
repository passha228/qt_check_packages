#include <QtTest>
#include "webchannelexample.h"

class TestWebChannelExample : public QObject
{
    Q_OBJECT

private slots:
    void testReceiveMessage();
};

void TestWebChannelExample::testReceiveMessage()
{
    WebChannelExample webChannelExample;
    QSignalSpy spy(&webChannelExample, &WebChannelExample::sendMessage);

    webChannelExample.receiveMessage("Test Message");

    QCOMPARE(spy.count(), 0); // Проверяем, что сигнал не был отправлен
    QVERIFY(true); // Просто проверка, что тест проходит
}

QTEST_APPLESS_MAIN(TestWebChannelExample)
#include "test_webchannelexample.moc"