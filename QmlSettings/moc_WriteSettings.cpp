/****************************************************************************
** Meta object code from reading C++ file 'WriteSettings.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "WriteSettings.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'WriteSettings.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_WriteSettings_t {
    QByteArrayData data[9];
    char stringdata0[95];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_WriteSettings_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_WriteSettings_t qt_meta_stringdata_WriteSettings = {
    {
QT_MOC_LITERAL(0, 0, 13), // "WriteSettings"
QT_MOC_LITERAL(1, 14, 13), // "writeSettings"
QT_MOC_LITERAL(2, 28, 0), // ""
QT_MOC_LITERAL(3, 29, 3), // "key"
QT_MOC_LITERAL(4, 33, 5), // "color"
QT_MOC_LITERAL(5, 39, 5), // "index"
QT_MOC_LITERAL(6, 45, 26), // "writeDefaultAppsByFileType"
QT_MOC_LITERAL(7, 72, 5), // "value"
QT_MOC_LITERAL(8, 78, 16) // "writeThemeConfig"

    },
    "WriteSettings\0writeSettings\0\0key\0color\0"
    "index\0writeDefaultAppsByFileType\0value\0"
    "writeThemeConfig"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_WriteSettings[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    2,   34,    2, 0x02 /* Public */,
       1,    2,   39,    2, 0x02 /* Public */,
       6,    2,   44,    2, 0x02 /* Public */,
       8,    2,   49,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void, QMetaType::QString, QMetaType::QString,    3,    4,
    QMetaType::Void, QMetaType::Int, QMetaType::QString,    5,    4,
    QMetaType::Void, QMetaType::QString, QMetaType::QString,    3,    7,
    QMetaType::Void, QMetaType::QString, QMetaType::QString,    3,    7,

       0        // eod
};

void WriteSettings::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<WriteSettings *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->writeSettings((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 1: _t->writeSettings((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 2: _t->writeDefaultAppsByFileType((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 3: _t->writeThemeConfig((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject WriteSettings::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_WriteSettings.data,
    qt_meta_data_WriteSettings,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *WriteSettings::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *WriteSettings::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_WriteSettings.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int WriteSettings::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 4)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 4;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
