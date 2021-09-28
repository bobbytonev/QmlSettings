/****************************************************************************
** Meta object code from reading C++ file 'process.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "process.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'process.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_process_t {
    QByteArrayData data[15];
    char stringdata0[144];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_process_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_process_t qt_meta_stringdata_process = {
    {
QT_MOC_LITERAL(0, 0, 7), // "process"
QT_MOC_LITERAL(1, 8, 15), // "finishedChanged"
QT_MOC_LITERAL(2, 24, 0), // ""
QT_MOC_LITERAL(3, 25, 15), // "timeZoneChanged"
QT_MOC_LITERAL(4, 41, 10), // "changeTime"
QT_MOC_LITERAL(5, 52, 4), // "time"
QT_MOC_LITERAL(6, 57, 17), // "automaticTimeZone"
QT_MOC_LITERAL(7, 75, 4), // "flag"
QT_MOC_LITERAL(8, 80, 12), // "startProcess"
QT_MOC_LITERAL(9, 93, 15), // "reloadTimeZones"
QT_MOC_LITERAL(10, 109, 4), // "eval"
QT_MOC_LITERAL(11, 114, 4), // "name"
QT_MOC_LITERAL(12, 119, 8), // "fileName"
QT_MOC_LITERAL(13, 128, 6), // "finish"
QT_MOC_LITERAL(14, 135, 8) // "timeZone"

    },
    "process\0finishedChanged\0\0timeZoneChanged\0"
    "changeTime\0time\0automaticTimeZone\0"
    "flag\0startProcess\0reloadTimeZones\0"
    "eval\0name\0fileName\0finish\0timeZone"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_process[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       2,   68, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   49,    2, 0x06 /* Public */,
       3,    0,   50,    2, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
       4,    1,   51,    2, 0x02 /* Public */,
       6,    1,   54,    2, 0x02 /* Public */,
       8,    1,   57,    2, 0x02 /* Public */,
       9,    0,   60,    2, 0x02 /* Public */,
      10,    3,   61,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void, QMetaType::QString,    5,
    QMetaType::Void, QMetaType::QString,    7,
    QMetaType::Void, QMetaType::QString,    0,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString,    0,   11,   12,

 // properties: name, type, flags
      13, QMetaType::Bool, 0x00495003,
      14, QMetaType::QStringList, 0x00495103,

 // properties: notify_signal_id
       0,
       1,

       0        // eod
};

void process::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<process *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->finishedChanged(); break;
        case 1: _t->timeZoneChanged(); break;
        case 2: _t->changeTime((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 3: _t->automaticTimeZone((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 4: _t->startProcess((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 5: _t->reloadTimeZones(); break;
        case 6: _t->eval((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (process::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&process::finishedChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (process::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&process::timeZoneChanged)) {
                *result = 1;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<process *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< bool*>(_v) = _t->finish(); break;
        case 1: *reinterpret_cast< QStringList*>(_v) = _t->timeZone(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<process *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->isFinished(*reinterpret_cast< bool*>(_v)); break;
        case 1: _t->setTimeZone(*reinterpret_cast< QStringList*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject process::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_process.data,
    qt_meta_data_process,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *process::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *process::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_process.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int process::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 7;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 2;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void process::finishedChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void process::timeZoneChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
