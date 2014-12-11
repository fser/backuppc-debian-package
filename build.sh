#!/usr/bin/env bash

SRC_DIR="source_files"
CURRENT_DIR=$PWD
DST_DIR="${CURRENT_DIR}/local"
FILES=(
    'BackupPC-XS-0.30.tar.gz'
    'rsync-bpc-3.0.9.3.tar.gz' 
    'BackupPC-4.0.0alpha3.tar.gz'
)

if [[ $(id -ur) != "0" ]]; then
#    SUDO="sudo"
    SUDO=""
else
    SUDO=""
fi
if [[ ! -d ${DST_DIR} ]]; then
    echo "Creating ${DST_DIR}"
    mkdir ${DST_DIR}
fi

function build_package
{
    case $1 in
	BackupPC-XS-0.30.tar.gz)
	    tar xzf $1
	    cd BackupPC-XS-0.30
	    sed -iold "s@./configure.sh@./configure.sh --prefix=$DST_DIR@" Makefile.PL
	    perl Makefile.PL
	    echo "***gruik woraround***"
	    ln zlib/zlib.h zlib.h
	    ln zlib/zconf.h zconf.h
	    echo "***done (glurp)***"
	    make
	    make test
	    # Todo : overlayfs ?
	    ${SUDO} make build
	    echo "======="
	    echo "XS done"
	    echo "======="
	    ;;
	rsync-bpc-3.0.9.3.tar.gz)
	    tar xzf $1
	    cd sync-bpc-3.0.9.3
	    ./configure.sh --prefix=${DST_DIR}
	    echo "***gruik woraround***"
	    ln zlib/zlib.h zlib.h
	    ln zlib/zconf.h zconf.h
	    echo "***done (glurp)***"
	    make
	    make build # This one is sane (uses prefix) :)
	    echo "=========="
	    echo "rsync done"
	    echo "=========="
	    ;;
	BackupPC-4.0.0alpha3.tar.gz)
	    tar xzf $1
	    cd BackupPC-4.0.0alpha3
	    ./configure.pl --dest-dir ${DST_DIR}
	    echo "============="
	    echo "backupPC done"
	    echo "============="
	    ;;
	*)
	    echo "How should I build $1?"
	    ;;
    esac
}

function main 
{
    cd ${SRC_DIR}

    for package in ${FILES[*]}; do
	echo "[+] Processing ${package}"
	if [[ ! -e ${package} ]]; then
	    echo "${package} was not found in ${SRC_DIR}!"
	else
	    echo build_package ${package}
	fi
    done
}


main