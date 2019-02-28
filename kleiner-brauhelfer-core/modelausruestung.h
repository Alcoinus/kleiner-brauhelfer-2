#ifndef MODELAUSRUESTUNG_H
#define MODELAUSRUESTUNG_H

#include "sqltablemodel.h"

class Brauhelfer;

class ModelAusruestung : public SqlTableModel
{
public:
    ModelAusruestung(Brauhelfer* bh, QSqlDatabase db = QSqlDatabase());
    QVariant dataExt(const QModelIndex &index) const Q_DECL_OVERRIDE;
    bool setDataExt(const QModelIndex &index, const QVariant &value) Q_DECL_OVERRIDE;
    void defaultValues(QVariantMap &values) const Q_DECL_OVERRIDE;
private:
    Brauhelfer* bh;
};

#endif // MODELAUSRUESTUNG_H
