// Copyright (c) 2011-2014 The Gtacoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef GTACOIN_QT_GTACOINADDRESSVALIDATOR_H
#define GTACOIN_QT_GTACOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class GtacoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit GtacoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Gtacoin address widget validator, checks for a valid gtacoin address.
 */
class GtacoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit GtacoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // GTACOIN_QT_GTACOINADDRESSVALIDATOR_H
