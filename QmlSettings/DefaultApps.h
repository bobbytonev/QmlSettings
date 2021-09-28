


#include <QObject>
#include <QVariantList>
#include <QSettings>
#include <QQuickStyle>
#include <QDebug>
#include <QMimeDatabase>
#include <QDirIterator>
#include <QFileInfo>
#include <QString>
class DefaultApps : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantList defaultApps READ defaultApps WRITE setDefaultApps NOTIFY defaultAppsChanged)
	
	
	Q_PROPERTY(QVariantList apps READ apps WRITE setApps NOTIFY appsChanged)

const QString  SYSTEM_APPLICATIONS = "/usr/share/applications";



	struct Info{
        QString name,icon{"application"},path,mimetype,category;
    }info;

public:


Q_INVOKABLE void load(QString mimetype,QString startWith){
	
	 QDirIterator it(SYSTEM_APPLICATIONS, {"*.desktop"}, QDir::NoFilter, QDirIterator::Subdirectories);
          
m_apps.clear();
           while (it.hasNext()) {
               QString filename = it.next();
			   
			   
			  
			  
                QSettings desktopFile(filename, QSettings::IniFormat);
                desktopFile.beginGroup("Desktop Entry");
				 QString config_dir = QFileInfo(desktopFile.fileName()).fileName();
              info.path = desktopFile.value("Exec").toString().remove("\"").remove(QRegExp(" %."));
              info.icon = desktopFile.value("Icon", "application").toString();
              info.name = desktopFile.value("Name").toString();
			 
			
		if(getMimeType(filename,mimetype,startWith)){
			m_apps.append(QStringList{info.name, info.icon, info.path});
		}

             
                desktopFile.endGroup();

               }
		   
               emit appsChanged();
	
}

 bool getMimeType(QString fileName,QString mimeType,QString startWith){
	QString type;
	 QFile inputFile(fileName);
		if (inputFile.open(QIODevice::ReadOnly))
		{
		QTextStream in(&inputFile);
		while (!in.atEnd())
		{
		QString line = in.readLine();
		if(line.startsWith(startWith)){
			type=line;
			break;
		}
		
      
		}
   inputFile.close();
}
	return type.contains(mimeType,Qt::CaseInsensitive);
}
 
 
 Q_INVOKABLE QStringList read(QString key){
	 
	 QSettings settings(QSettings::NativeFormat,QSettings::UserScope,"kos-default-apps", "Apps");
             settings.beginGroup("Apps");
			 
			 
			 QString value =settings.value(key,"").toString();
			 
			 QStringList list = value.split(',');
			 
			 settings.endGroup();
			 
			 return list;
 }

   Q_INVOKABLE void  reload(){

        if(!flag){
			 QMimeDatabase mime;
		m_defaultApps.clear();

			

			for(int i=0;i<mime.allMimeTypes().size();i++){
				if(!mime.allMimeTypes()[i].preferredSuffix().isEmpty())
					m_defaultApps.append(QStringList{mime.allMimeTypes()[i].name(),"."+mime.allMimeTypes()[i].preferredSuffix()});
				
			}
			
		
		emit defaultAppsChanged();
		flag=true;
		}

    }
    void setDefaultApps(const QVariantList &a) {
        if (a != m_defaultApps) {
            m_defaultApps = a;
            emit defaultAppsChanged();
        }
    }
   QVariantList defaultApps() const {
        return m_defaultApps;
    }
	
	
	void setApps(const QVariantList &a) {
        if (a != m_apps) {
            m_apps = a;
            emit appsChanged();
        }
    }
   QVariantList apps() const {
        return m_apps;
    }
signals:
    void defaultAppsChanged();
	 void appsChanged();

private:
    QVariantList m_defaultApps;
	 QVariantList m_apps;
	bool flag=false;
};


