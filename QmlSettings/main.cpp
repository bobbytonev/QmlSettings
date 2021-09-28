#include <QGuiApplication>
#include <QNetworkInterface>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include <QSharedMemory>
#include <QMessageBox>
#include <QWindow>

#include "colormanager.h"
#include "WriteSettings.h"

#include <QFileSystemWatcher>

#include <QSettings>
#include <QTranslator>
#include <QFileInfo>
#include <QDebug>
#include "ProgramLauncher.h"

#include "imageprovider.h"
#include "Language.h"
#include "SystemInformation.h"
#include "StartupApps.h"

#include "DefaultApps.h"
#include "process.h"

#include "ThemeManager.h"
QString getMacAddress()
{
foreach(QNetworkInterface netInterface, QNetworkInterface::allInterfaces())
{

if (!(netInterface.flags() & QNetworkInterface::IsLoopBack))
return netInterface.hardwareAddress();
}
return QString();
}



QSharedMemory shared("t28VOtVYil"); //Global variable
int main(int argc, char *argv[])
{
	//page
	//app
	
	
	

	if( !shared.create( 512, QSharedMemory::ReadWrite) )
    {
        // QMessageBox msgBox;
        //QMessageBox::critical(0, QObject::tr("App is already running!"), QObject::tr("App is already running!"), QMessageBox::Ok, QMessageBox::Ok);
       // qCritical() << "Cevirgec is already running!";
		//system("sudo pkill QmlSettings");
       // exit(0);
    }
   
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.rootContext()->setContextProperty("macAddress",getMacAddress());








	//theme watcher
	QSettings themeConfigSettings(QSettings::NativeFormat,QSettings::UserScope,"theme-config", "Theme");
	QString theme_config_dir = QFileInfo(themeConfigSettings.fileName()).absolutePath() + "/";
	QFileSystemWatcher themeConfigWatcher;
	themeConfigWatcher.addPath(theme_config_dir);
	
	ThemeManager themeManager;
	
	//QStringList list{"/usr/share/icons"};
	//QIcon::setThemeSearchPaths(list);
	
    engine.rootContext()->setContextProperty("tcm", &themeManager);
    themeManager.setTheme(themeManager.reload());  
	 
	QObject::connect(&themeConfigWatcher,SIGNAL(directoryChanged(QString)),&themeManager,SLOT(settings(QString)));
 
	//end

	QQuickStyle::setStyle("/usr/share/themes/"+themeManager.theme()[2].toString());


//QQuickStyle::setStyle("Material");

 QSettings settings(QSettings::NativeFormat,QSettings::UserScope,QQuickStyle::name(), "Themes");

//QString config_dir = QFileInfo(settings.fileName()).absolutePath() + "/";
QString config_dir = QFileInfo(settings.fileName()).absolutePath() + "/";

QFileSystemWatcher watcher;
   watcher.addPath(config_dir);


ColorManager msg;
 engine.rootContext()->setContextProperty("msg", &msg);
 msg.setColors(msg.reload());

 QScopedPointer<WriteSettings> write(new WriteSettings);
 

 engine.rootContext()->setContextProperty("settings",write.data());

 Language lang;
 engine.rootContext()->setContextProperty("lang", &lang);


 QObject::connect(&watcher,SIGNAL(directoryChanged(QString)),&msg,SLOT(settings(QString)));

     //watch for program change
 QFileSystemWatcher programWatcher;
      programWatcher.addPath("/usr/share/applications");
	  
	  
	  
	
	ProgramLauncher programs;
	programs.setEnvSettings(argc,argv);
      engine.rootContext()->setContextProperty("launcher", &programs);
      
 QObject::connect(&programWatcher,SIGNAL(directoryChanged(QString)),&programs,SLOT(settings(QString)));
 
 
 
 
 QFileSystemWatcher startupAppsWatcher;
 startupAppsWatcher.addPath("/etc/xdg/autostart");
 
 StartupApps startupApps;
 engine.rootContext()->setContextProperty("startupApps", &startupApps);
 
 QObject::connect(&startupAppsWatcher,SIGNAL(directoryChanged(QString)),&startupApps,SLOT(settings(QString)));

engine.addImageProvider("icons", new ImageProvider());


SystemInformation info;
engine.rootContext()->setContextProperty("info", &info);

DefaultApps defaultApps;
 engine.rootContext()->setContextProperty("defaultApps", &defaultApps);
 
 process process;
 engine.rootContext()->setContextProperty("process", &process);
	
	
	//QObject* m_rootObject = engine.rootObjects().first();
       // QWindow* w = qobject_cast<QWindow*>(m_rootObject);
	
	//QObject::connect(w, &QObject::destroyed, [](QObject * obj){
      //exit(0);
	 // qDebug()<<"HERE";
   // });
	
	
	engine.load(url);
	



    return app.exec();
}
