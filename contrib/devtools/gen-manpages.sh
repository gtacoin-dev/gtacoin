#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

GTACOIND=${GTACOIND:-$SRCDIR/gtacoind}
GTACOINCLI=${GTACOINCLI:-$SRCDIR/gtacoin-cli}
GTACOINTX=${GTACOINTX:-$SRCDIR/gtacoin-tx}
GTACOINQT=${GTACOINQT:-$SRCDIR/qt/gtacoin-qt}

[ ! -x $GTACOIND ] && echo "$GTACOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
SYSVER=($($GTACOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for gtacoind if --version-string is not set,
# but has different outcomes for gtacoin-qt and gtacoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$GTACOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $GTACOIND $GTACOINCLI $GTACOINTX $GTACOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${SYSVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${SYSVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
