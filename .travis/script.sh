#!/bin/bash

if [ "${TRAVIS_OS_NAME}" = "osx" ]; then
    # sudo chown -R $USER $(brew --repo);
    # sudo chown -R $USER $(brew --prefix);
    brew tap sbfnk/libbi;
    # brew install gcc llvm;
    # brew link --overwrite gcc;
    brew install libbi-sbfnk --HEAD;
fi
if [ "${TRAVIS_OS_NAME}" = "linux" ]; then
    sudo mkdir -p /home/linuxbrew;
    sudo chown "$USER" /home/linuxbrew;
    LINUXBREW=/home/linuxbrew/.linuxbrew;
    git clone https://github.com/Linuxbrew/brew.git "$LINUXBREW";
    export PATH="$LINUXBREW/bin:$PATH";
    # export LD_LIBRARY_PATH=$(echo $LD_LIBRARY_PATH | sed 's/:$//');
    brew tap sbfnk/libbi;
    # brew install --with-libidn curl;
    # brew install --with-libidn gmp;
    brew install libbi-sbfnk --HEAD;
    # mkdir -p ~/.R;
    # echo "Q0M9L3Vzci9iaW4vZ2NjCkNYWD0vdXNyL2Jpbi9nKysKQ0ZMQUdTPS1zdGQ9Yzk5ICRDRkxBR1MKQ1hYRkxBR1M9LXN0ZD1jKys5OSAkQ1hYRkxBR1M=" | base64 -D > ~/.R/Makevars;
fi
