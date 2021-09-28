#ifndef WRITESETTINGS_H
#define WRITESETTINGS_H

#include <QObject>
#include <QVariantList>
#include <QSettings>
#include <QQuickStyle>
#include <QFileSystemWatcher>
#include <QDebug>
class WriteSettings : public QObject{
     Q_OBJECT
	
  

public:
    Q_INVOKABLE void  writeSettings(QString key ,QString color){
     QSettings settings(QSettings::NativeFormat,QSettings::UserScope,QQuickStyle::name(), "Themes");
             settings.beginGroup("Themes");
             settings.setValue(key,color);
		settings.sync();
             settings.endGroup();
                settings.sync();
				
			qDebug()<<settings.fileName();
			

    }
    Q_INVOKABLE void  writeSettings(int index ,QString color){
      QSettings settings(QSettings::NativeFormat,QSettings::UserScope,QQuickStyle::name(), "Themes");
             settings.beginGroup("Themes");

            settings.setValue( settings.childKeys().at(index),color);
			settings.sync();
             settings.endGroup();
                settings.sync();
				
				
				

    }
	
	Q_INVOKABLE void  writeDefaultAppsByFileType(QString key ,QString value){
      QSettings settings(QSettings::NativeFormat,QSettings::UserScope,"kos-default-apps", "Apps");
             settings.beginGroup("Apps");

            settings.setValue(key,value);
			settings.sync();
             settings.endGroup();
                settings.sync();
				
				
				

    }
	Q_INVOKABLE void writeThemeConfig(QString key ,QString value){
		 QSettings settings(QSettings::NativeFormat,QSettings::UserScope,"theme-config", "Theme");
             settings.beginGroup("Theme");

            settings.setValue(key,value);
			settings.sync();
             settings.endGroup();
                settings.sync();
				
				
	}
	
	
	
	
	
};




#endif // WRITESETTINGS_H
