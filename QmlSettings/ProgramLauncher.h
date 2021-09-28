#ifndef PROGRAMLAUNCHER_H
#define PROGRAMLAUNCHER_H
#include <QObject>
#include <QVariantList>
#include <QSettings>
#include <QQuickStyle>
#include <QDirIterator>
#include <QIcon>
#include <QDebug>
class ProgramLauncher : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantList programs READ programs WRITE setPrograms NOTIFY programsChanged)
	

    const QString  SYSTEM_APPLICATIONS = "/usr/share/applications";
    const QString USER_APPLICATIONS = "%1/.local/share/applications";
	
	
	

    
	
	struct Info{
        QString name,icon{"application"},path,category,version,type,mimetype;
    }info;


public:
Q_INVOKABLE QStringList getEnvSettings(){
	return envSettings;
}

void setEnvSettings(int argc, char *argv[]){
	for (int i = 1; i < argc; i++){
		envSettings.append(QString::fromLocal8Bit(argv[i]));
	}
	
	
}

Q_INVOKABLE void  qmlReload(){
        if(!flag){
        setPrograms(reload());
            flag=true;
        }
    }
    QVariantList reload(){

        QDirIterator it(SYSTEM_APPLICATIONS, {"*.desktop"}, QDir::NoFilter, QDirIterator::Subdirectories);
           QVariantList ret;

           while (it.hasNext()) {
               QString filename = it.next();
                QSettings desktopFile(filename, QSettings::IniFormat);
                desktopFile.beginGroup("Desktop Entry");
				QString config_dir = QFileInfo(desktopFile.fileName()).fileName();
				
              info.path = desktopFile.value("Exec").toString().split(" ")[0];
              info.icon = desktopFile.value("Icon", "application").toString();
               info.name = desktopFile.value("Name").toString();
				info.category=desktopFile.value("Categories").toString();
				info.version=desktopFile.value("Version").toString();
				
				
				
				
				info.mimetype ="";
				
				
				
				
				
				
				info.type=desktopFile.value("Type").toString();
              // QString split =info.name;
              // QStringList nameFormat=split.split(" ");
		if(!info.name.isEmpty()){
		 ret.append(QStringList{info.name, info.icon, info.path,info.category,info.version,info.type,config_dir,info.mimetype});
		}

               //if(nameFormat.size()>3){
                  // for(int i=3;i<nameFormat.size();i++){
                   // nameFormat.removeLast();
                  // }
              // }
              // info.name=nameFormat.join(" ");
               //QIcon icon = QIcon::fromTheme(info.icon);
               //if(!icon.isNull()){
              // }
                //ret.append(QStringList{info.name, info.icon, info.path});
                desktopFile.endGroup();

               }

                return ret;
           }







    void setPrograms(const QVariantList &a) {
        if (a != m_programs) {
            m_programs = a;
            emit programsChanged();
        }
    }
	
   QVariantList programs() const {
        return m_programs;
    }
	
signals:
    void programsChanged();
	


public slots:
    void settings(const QString& str)
    {
        Q_UNUSED(str)
       setPrograms(reload());
    }
	
	
private:
    QVariantList m_programs;
	QStringList envSettings;
	
	  bool flag=false;
};




#endif // PROGRAMLAUNCHER_H
