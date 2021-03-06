#!/bin/bash

# Needed for the tests.
export CFLAGS="-std=c99 ${CFLAGS}"

if [ "`uname`" == 'Darwin' ]
then
    export LIBRARY_SEARCH_VAR=DYLD_FALLBACK_LIBRARY_PATH
else
    export LIBRARY_SEARCH_VAR=LD_LIBRARY_PATH
fi

autoreconf -ivf
./configure --prefix=${PREFIX} \
            --with-expat \
            --without-nettle \
            --without-lz4 \
            --without-lzmadec \
            --without-xml2
make -j${CPU_COUNT}
#eval ${LIBRARY_SEARCH_VAR}="${PREFIX}/lib" make check
make install
