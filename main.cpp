#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "todolistmodel.h"

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    ToDoListModel toDoListModel;
    engine.rootContext()->setContextProperty("toDoListModel", &toDoListModel);

    const QUrl url(u"qrc:/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}
