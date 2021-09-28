
#include <QObject>
#include <QVariantList>
#include <QSettings>
#include <QQuickStyle>
#include <QDirIterator>
#include <QIcon>
#include <QDebug>
#include <QFile>
#include <QFileInfo>
class StartupApps : public QObject
{
    Q_OBJECT
    
	Q_PROPERTY(QVariantList startupApps READ startupApps WRITE setStartupApps NOTIFY startupAppsChanged)

   
	
	
	const QString STARTUP_APPS = "/etc/xdg/autostart";

    
	
	struct Info{
        QString name,icon{"application"},path,filePath;
    }info;


public:
Q_INVOKABLE void  qmlReload(){
        if(!flag){
        setStartupApps(reload());
            flag=true;
        }
    }
	
	
	Q_INVOKABLE void addApp(QString app){
       
	   qDebug()<<"APP:"<<app;
	   QFile dir;
	   dir.copy("/usr/share/applications/"+app,"/etc/xdg/autostart/"+app);
	   
	   
    }
	
	Q_INVOKABLE void deleteApp(QString app){
       
	  QFile dir;
	   dir.remove("/etc/xdg/autostart/"+app);
	   
	   
    }
   
QVariantList reload(){

		
	
        QDirIterator it(STARTUP_APPS, {"*.desktop"}, QDir::NoFilter, QDirIterator::Subdirectories);
           QVariantList ret;

           while (it.hasNext()) {
               QString filename = it.next();
			   
			  
                QSettings desktopFile(filename, QSettings::IniFormat);
                desktopFile.beginGroup("Desktop Entry");
				 QString config_dir = QFileInfo(desktopFile.fileName()).fileName();
              info.path = desktopFile.value("Exec").toString().remove("\"").remove(QRegExp(" %."));
              info.icon = desktopFile.value("Icon", "application").toString();
              info.name = desktopFile.value("Name").toString();
			
		if(!info.name.isEmpty()){
		ret.append(QStringList{info.name, info.icon, info.path,config_dir});
		}

             
                desktopFile.endGroup();

               }
		   
                return ret;
				
		   
           }
		   
		   





    
	void setStartupApps(const QVariantList &a) {
        if (a != m_startupApps) {
            m_startupApps = a;
            emit startupAppsChanged();
        }
    }
   
	QVariantList startupApps() const {
        return m_startupApps;
    }
signals:
    void startupAppsChanged();



public slots:
	void settings(const QString& str){
		 Q_UNUSED(str)
       setStartupApps(reload());
	}
private:
	QVariantList m_startupApps;
	  bool flag=false;
};





