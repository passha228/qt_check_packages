#include <QApplication>
#include <QWebEngineView>
#include <QWebChannel>
#include "webchannelexample.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QWebEngineView view;
    WebChannelExample webChannelExample;

    QWebChannel channel;
    channel.registerObject("webChannelExample", &webChannelExample);
    view.page()->setWebChannel(&channel);

    view.setUrl(QUrl("qrc:/index.html"));
    view.resize(800, 600);
    view.show();

    return app.exec();
}