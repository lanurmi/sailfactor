#include <QtQuick>

#include <sailfishapp.h>
#include <QScopedPointer>
#include <QQuickView>
#include <QQmlEngine>
#include <QGuiApplication>

#include "factor.h"

int main(int argc, char *argv[])
{
    QScopedPointer<QGuiApplication> app(SailfishApp::application(argc, argv));
    QScopedPointer<QQuickView> view(SailfishApp::createView());

    Factorizer fact;

#ifdef QT_QML_DEBUG
    runUnitTests();
#endif

    view->engine()->rootContext()->setContextProperty("fact", &fact);
    view->setSource(SailfishApp::pathTo("qml/main.qml"));

    view->setTitle("Sailfactor");

    app->setApplicationName("harbour-sailfactor");
    app->setApplicationDisplayName("Sailfactor");

    view->show();

    return app->exec();
}
