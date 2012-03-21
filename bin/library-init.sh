#!/bin/bash

# This file will set up Git / SVN externals in library/


# Is SVN installed and in the path?

svn &>/dev/null

if [[ $? -eq 127 ]]; then
    echo ERROR: SVN not installed or not in the path
    exit
fi

git &>/dev/null

if [[ $? -eq 127 ]]; then
    echo ERROR: Git not installed or not in the path
    exit
fi

LIBDIR=`dirname "$0"`/../library
TOPDIR=`dirname "$0"`/..

# Smarty

if [[ -e $LIBDIR/Smarty ]]; then
    echo Smarty exists - skipping!
else
    svn co http://smarty-php.googlecode.com/svn/trunk/distribution/libs/ $LIBDIR/Smarty
fi


# Twitter form decorators
if [[ -e $LIBDIR/Bootstrap-Zend-Framework ]]; then
    echo Bootstrap-Zend-Framework exists - skipping!
else
    git clone git://github.com/inex/Bootstrap-Zend-Framework.git $LIBDIR/Bootstrap-Zend-Framework
fi

# Minifier
if [[ -e $LIBDIR/Minify ]]; then
    echo Minify exists - skipping!
else
    git clone git://github.com/opensolutions/Minify.git $LIBDIR/Minify
fi


# Zend

if [[ -e $LIBDIR/Zend ]]; then
    echo Zend exists - skipping!
else 
    svn co http://framework.zend.com/svn/framework/standard/branches/release-1.11/library/Zend/ $LIBDIR/Zend
fi 
        
        
# Doctrine
if [[ -e $LIBDIR/Doctrine ]]; then
    echo Doctrine exists - skipping!
else
    svn co http://svn.doctrine-project.org/branches/1.2/lib $LIBDIR/Doctrine
fi
        
                                            