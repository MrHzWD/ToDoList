// todolistmodel.cpp
#include \"todolistmodel.h\"

ToDoListModel::ToDoListModel(QObject *parent) : QAbstractListModel(parent) {}

int ToDoListModel::rowCount(const QModelIndex &parent) const {
    if (parent.isValid()) return 0;
    return m_items.size();
}

QVariant ToDoListModel::data(const QModelIndex &index, int role) const {
    if (!index.isValid() || index.row() >= m_items.size()) return QVariant();

    const ToDoItem &item = m_items.at(index.row());
    switch (role) {
    case TextRole: return item.text;
    case DoneRole: return item.done;
    default: return QVariant();
    }
}

QHash<int, QByteArray> ToDoListModel::roleNames() const {
    return {{TextRole, \"text\"}, {DoneRole, \"done\"}};
        }

        void ToDoListModel::addItem(const QString &text) {
            beginInsertRows(QModelIndex(), m_items.size(), m_items.size());
            m_items.append({text, false});
            endInsertRows();
        }

        void ToDoListModel::removeItem(int index) {
            if (index < 0 || index >= m_items.size()) return;
            beginRemoveRows(QModelIndex(), index, index);
            m_items.removeAt(index);
            endRemoveRows();
        }

        void ToDoListModel::toggleDone(int index) {
            if (index < 0 || index >= m_items.size()) return;
            m_items[index].done = !m_items[index].done;
            emit dataChanged(this->index(index), this->index(index), {DoneRole});
        }
