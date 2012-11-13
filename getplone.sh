#! /bin/bash
# we have buildout based on settings in requirements.txt
buildout init
wget http://dl.dropbox.com/u/1004432/plonewsgi.cfg -O buildout.cfg

# get eggs previously compiled for python2.7 on a dotcloud machine
wget http://dl.dropbox.com/u/1004432/dotcloudplone/eggs.tgz -O eggs.tgz
tar xfz eggs.tgz
buildout
