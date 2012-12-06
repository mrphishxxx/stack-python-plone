#! /bin/bash
# we have buildout based on settings in requirements.txt
buildout init
wget http://dl.dropbox.com/u/1004432/plone.cfg -O buildout.cfg
mkdir -p /home/dotcloud/data

# get eggs previously compiled for python2.7 on a dotcloud machine
if [ ! -f /home/dotcloud/data/eggs.tgz ];                                                                                                       
then                                                                                                                        
    echo "Downloading egg bundle" 
    wget https://plone-egg-packages.googlecode.com/files/eggs.tgz -O /home/dotcloud/data/eggs.tgz    
    cd /home/dotcloud/data
    tar xfz eggs.tgz
fi
cd /home/dotcloud/current
buildout
