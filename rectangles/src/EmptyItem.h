#ifndef EMPTY_ITEM_H
#define EMPTY_ITEM_H

#include <QQmlEngine>
#include <QQuickItem>

class EmptyItem : public QQuickItem {
    Q_OBJECT

    QML_ELEMENT

public:
    explicit EmptyItem(QQuickItem* parent = nullptr);
};

#endif
