#! /bin/bash
# we have buildout based on settings in requirements.txt
buildout init
#wget http://dl.dropbox.com/u/1004432/plone.cfg -O buildout.cfg
mkdir -p /home/dotcloud/data

# get eggs previously compiled for python2.7 on a dotcloud machine
if [ ! -f /home/dotcloud/data/eggs.tgz ];                                                                                                       
then                                                                                                                        
    echo "Downloading egg bundle" 
    wget http://plone-egg-packages.googlecode.com/files/eggs-dec062012.tgz -O /home/dotcloud/data/eggs.tgz    
    cd /home/dotcloud/data
    tar xfz eggs.tgz
fi
cd /home/dotcloud/current
python mkbuildout.py
buildout
cat adminPassword.txt
