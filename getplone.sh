#! /bin/bash
virtualenv -p python2.7 .
bin/pip install zc.buildout
bin/buildout init
wget https://dl.dropbox.com/u/1004432/plonewsgi.cfg -O buildout.cfg
tar xfz eggs.tgz
bin/buildout
