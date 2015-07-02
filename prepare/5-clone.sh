#!/usr/bin/env bash

BASE_DIR=/home/vagrant
cd $BASE_DIR

# all parts of ega
for OP in faops egaz egas alignDB withncbi
do
    if [ ! -d $BASE_DIR/$OP/.git ]
    then
        echo " + Clone $OP"
        git clone https://github.com/wang-q/$OP.git $BASE_DIR/$OP
    else
        echo " + Pull $OP"
        cd $BASE_DIR/$OP
        git pull
    fi
done

# make sure ~/bin in your $PATH
if grep -q -i homebin ~/.bashrc; then
    echo " + .bashrc already contains homebin"
else
    echo " + Update .bashrc"

    HOME_PATH='export PATH="$HOME/bin:$PATH"'
    echo '# Homebin' >> ~/.bashrc
    echo $HOME_PATH >> ~/.bashrc
    echo >> ~/.bashrc

    eval $HOME_PATH
fi
mkdir -p ~/bin
cd $BASE_DIR/faops && make && cp faops ~/bin

# node stuffs
echo " + Clone ega"
sudo chown vagrant:vagrant $BASE_DIR/ega -R
cd $BASE_DIR/ega
git clone https://github.com/wang-q/ega.git tmp && mv tmp/.git . && rm -rf tmp && git reset --hard

npm --verbose -g install nodemon
npm --verbose -g install bower
npm --verbose -g install express-generator

npm --verbose install
bower --verbose install
cp settings.js.example settings.js