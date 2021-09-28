#ifndef LANGUAGE_H
#define LANGUAGE_H
#include <QObject>
#include <QVariantList>
#include <QSettings>
#include <QQuickStyle>
#include <QLocale>
#include <QDebug>
class Language : public QObject
{
    Q_OBJECT

   public:


     Q_PROPERTY(QVariantList language READ language WRITE setLanguage NOTIFY languageChange)

    Q_INVOKABLE QVariantList load(){
        QVariantList var;
        QList<QLocale> allLocales = QLocale::matchingLocales(
                QLocale::AnyLanguage,
                QLocale::AnyScript,
                QLocale::AnyCountry);
        QSet<QString> remove;
       for(int i=0;i<allLocales.size();i++){
         remove.insert(allLocales[i].languageToString(allLocales[i].language()));
       }
        foreach (const QString &value, remove)
          var.append(value);

           return var;
}
    void setLanguage(const QVariantList &a) {
        if (a != m_language&&!flag) {
            m_language = a;
            emit languageChange();
            flag=true;
        }
    }
   QVariantList language() const {
        return m_language;
    }
signals:
    void languageChange();

private:
   QVariantList m_language;
   bool flag=false;
};
#endif // LANGUAGE_H
