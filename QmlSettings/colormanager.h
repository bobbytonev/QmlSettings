#ifndef MESSAGE_H
#define MESSAGE_H


#include <QObject>
#include <QVariantList>
#include <QSettings>
#include <QQuickStyle>
#include <QDebug>
class ColorManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantList colors READ colors WRITE setColors NOTIFY colorsChanged)
	
	
	Q_PROPERTY(QVariantList colorsName READ colorsName WRITE setColorsName NOTIFY colorsNameChanged)




public:


    
	
	
	QVariantList reload(){

        QVariantList colorList;
		QVariantList colorNameList;
		

          QSettings settings(QSettings::NativeFormat,QSettings::UserScope,QQuickStyle::name(), "Themes");
		  // QSettings settings(QSettings::NativeFormat,"/home/bobby",QQuickStyle::name(), "Themes");
                settings.beginGroup("Themes");
                QStringList childKeys = settings.childKeys();
          foreach (const QString &childKey, childKeys){
			  
          QVariant var(settings.value(childKey));
		  colorList.append(var);
		  colorNameList.append(childKey);
			
          }

			setColorsName( colorNameList);

               settings.endGroup();
               return colorList;

    }
    void setColors(const QVariantList &a) {
        if (a != m_colors) {
            m_colors = a;
            emit colorsChanged();
        }
    }
   QVariantList colors() const {
        return m_colors;
    }
	
	void setColorsName(const QVariantList &a) {
        if (a != m_colorsName) {
            m_colorsName = a;
            emit colorsChanged();
        }
    }
   QVariantList colorsName() const {
        return m_colorsName;
    }
signals:
    void colorsChanged();
	void colorsNameChanged();


public slots:
    void settings(const QString& str)
    {
        Q_UNUSED(str)
       setColors(reload());
	   qDebug()<<"Change";
    }
private:
    QVariantList m_colors;
	QVariantList m_colorsName;
};


#endif // MESSAGE_H
