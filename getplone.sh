#! /bin/bash
virtualenv -p python2.7 .
bin/pip install zc.buildout
bin/buildout init
wget http://dl.dropbox.com/u/1004432/plonewsgi.cfg -O buildout.cfg
wget http://dl.dropbox.com/u/1004432/dotcloudplone/eggs.tgz -O eggs.tgz
tar xfz eggs.tgz
bin/buildout
