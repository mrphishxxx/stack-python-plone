#! /bin/bash
# we have buildout based on settings in requirements.txt
buildout init
wget http://dl.dropbox.com/u/1004432/plone.cfg -O buildout.cfg

# get eggs previously compiled for python2.7 on a dotcloud machine
wget http://dl.dropbox.com/u/1004432/eggs.tgz -O eggs.tgz
tar xfz eggs.tgz
buildout
