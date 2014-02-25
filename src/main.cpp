#include <QtQuick>

#include <sailfishapp.h>
#include <QScopedPointer>
#include <QQuickView>
#include <QQmlEngine>
#include <QGuiApplication>

#include "factor.h"

int main(int argc, char *argv[])
{
    // For this example, wizard-generates single line code would be good enough,
    // but very soon it won't be enough for you anyway, so use this more detailed example from start
    QScopedPointer<QGuiApplication> app(SailfishApp::application(argc, argv));
    QScopedPointer<QQuickView> view(SailfishApp::createView());

    Factorizer fact;

#ifdef QT_QML_DEBUG
    runUnitTests();
#endif

//    Here's how you will add QML components whenever you start using them
//    Check https://github.com/amarchen/Wikipedia for a more full example
//    view->engine()->addImportPath(SailfishApp::pathTo("qml/components").toString());
    view->engine()->rootContext()->setContextProperty("fact", &fact);
    view->setSource(SailfishApp::pathTo("qml/main.qml"));

    view->setTitle("Sailfactor");

    app->setApplicationName("harbour-sailfactor");
    app->setApplicationDisplayName("Sailfactor");

    view->show();

    return app->exec();
}
