#include <QtQuick>

#include <sailfishapp.h>
#include <QScopedPointer>
#include <QQuickView>
#include <QQmlEngine>
#include <QGuiApplication>

#include "factor.h"

void loadTranslations() {
    QString langCode = QLocale::system().name().mid(0, 2);
    const QString Prefix("sailfactor_");

    if (QFile::exists(QString(":/lang/") + Prefix + langCode + ".qm")) {
        QTranslator *translator = new QTranslator(QCoreApplication::instance());
        translator->load(Prefix + langCode, ":/lang");
        QCoreApplication::installTranslator(translator);
    }
}

int main(int argc, char *argv[])
{
    QScopedPointer<QGuiApplication> app(SailfishApp::application(argc, argv));
    QScopedPointer<QQuickView> view(SailfishApp::createView());

    loadTranslations();

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
