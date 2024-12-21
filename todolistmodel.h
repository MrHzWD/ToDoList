#ifndef TODOLISTMODEL_H
#define TODOLISTMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include <QStringList>

struct ToDoItem {
    QString text;
    bool done;
};

class ToDoListModel : public QAbstractListModel {
    Q_OBJECT

public:
    enum ToDoRoles {
        TextRole = Qt::UserRole + 1,
        DoneRole
    };

    explicit ToDoListModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void addItem(const QString &text);
    Q_INVOKABLE void removeItem(int index);
    Q_INVOKABLE void toggleDone(int index);

private:
    QList<ToDoItem> m_items;
};

#endif
