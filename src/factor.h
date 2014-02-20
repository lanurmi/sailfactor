#ifndef FACTOR_H
#define FACTOR_H

#include <QObject>
#include <QDebug>

class Factorizer : public QObject
{
    Q_OBJECT
public:
    Factorizer();
    Q_INVOKABLE QString factorize(int in, int iterations) const;
public slots:
    void refresh() {
        qDebug() << "slot called";
    }
};

void runUnitTests();

#endif // FACTOR_H
