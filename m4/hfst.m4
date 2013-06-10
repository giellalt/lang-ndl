# hfst.m4 - Macros to locate and utilise HFST scripts -*- Autoconf -*-
# serial 1 (gtsvn-1)
# 
# Copyright © 2011 Divvun/Samediggi/UiT <bugs@divvun.no>.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 3 of the License.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#
# As a special exception to the GNU General Public License, if you
# distribute this file as part of a program that contains a
# configuration script generated by Autoconf, you may include it under
# the same distribution terms that you use for the rest of that program.

# gt_PROG_HFST([MIN-VERSION])
#
# Check to see that workable HFST installation exists near $PATH and is new
# enough to support gt building.
#
# MIN-VERSION should be a version vector with one to three digit series
#   separated by full stops. The default is 3.3.14 since it contains important
#   bug fixes required for the GT infra+HFST compilation to work.
# ---------------------------
AC_DEFUN([gt_PROG_HFST],
[AC_ARG_WITH([hfst], 
            [AS_HELP_STRING([--with-hfst=DIRECTORY],
            [define HFST binary path if not in PATH @<:@default=no@:>@])],
            [with_hfst=$withval],
            [with_hfst=no])
AC_PATH_PROG(HFST_INFO, hfst-info, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_COMPOSE, hfst-compose, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_COMPOSE_INTERSECT, hfst-compose-intersect, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_CONCATENATE, hfst-concatenate, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_CONJUNCT, hfst-conjunct, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_DETERMINIZE, hfst-determinize, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_DISJUNCT, hfst-disjunct, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_FST2FST, hfst-fst2fst, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_INVERT, hfst-invert, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_LEXC, hfst-lexc, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_LOOKUP, hfst-lookup, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_MINIMIZE, hfst-minimize, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_PROC, hfst-proc, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_PROJECT, hfst-project, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_REGEXP2FST, hfst-regexp2fst, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_REPEAT, hfst-repeat, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_REWEIGHT, hfst-reweight, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_SPLIT, hfst-split, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_STRINGS2FST, hfst-strings2fst, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_SUBSTITUTE, hfst-substitute, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_SUBTRACT, hfst-subtract, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_TWOLC, hfst-twolc, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_TXT2FST, hfst-txt2fst, false, $PATH$PATH_SEPARATOR$with_hfst)
AC_PATH_PROG(HFST_XFST, hfst-xfst, false, $PATH$PATH_SEPARATOR$with_hfst)
AS_IF([test x$with_hfst != xno], [
_gt_hfst_min_version=m4_default([$1], [3.4])
AC_MSG_CHECKING([hfst is at least $_gt_hfst_min_version])
if test x$HFST_INFO != xfalse; then
    if $HFST_INFO --require-feature=foma --atleast-version=$_gt_hfst_min_version ; then
        gt_prog_hfst=yes
        AC_MSG_RESULT([yes])
    else
        gt_prog_hfst=no
        AC_MSG_RESULT([no])
    fi
else
    AC_MSG_RESULT([no])
    AC_MSG_WARN([Unable to determine hfst version, might be too old and break])
    gt_prog_hfst=no
fi
], [gt_prog_hfst=no])
AM_CONDITIONAL([CAN_HFST], [test "x$gt_prog_hfst" = xyes])
]) # gt_PROG_HFST_PATH

# vim: set ft=config:
