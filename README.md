#Plone stack 

##What is this ?
This stack allows you to deploy a basic Plone instance to dotcloud. This configuration is not recommended for production deployments and is 
currently most suited for development (this may change in the future).

##What you get
A working Plone Site located at
`{yourinstance}-{useraccount}.dotcloud.com/Plone`

In this boiler plate you will find the basics to get a Plone stack running:
* Use of the dotCoud environment
* `getplone.sh` script `dotCloud.yml` a `postinstall script that grabs a set of packages (eggs) known to work on dotcloud and then builds a plone instance.
* this is NOT a wsgi based setup, it uses the more common approach of
  running a zope instance proxied by a webserver (in this case nginx)
* everything is done for you and the instance is managed using supervisord
* zopeskel for generating new plone packages quickly
* a bunch of convenience commands for managing your Plone site remotely
* If you are using Cloud9 IDE there is a custom approach noted below.

##What you need

Before you begin, make sure that you have and know your dotcloud account credentials.

##Step 1 - Installation:
In this step we prepare and create a new dotcloud stack (in our context this 
will become a server running Plone). 
Start by cloning the stack:

    plonestack=stackname
    git clone git://github.com/pigeonflight/stack-python-plone.git $plonestack
    cd $plonestack

###Ubuntu/Debian or OSX
If you are on a unix terminal, the following command should work (*Cloud9 IDE* users may skip this step):

    sudo easy_install pip
    sudo pip install -r requirements
    dotcloud setup

###Cloud9 IDE Specific step
If you are using Cloud9 IDE the following commands will configure the dotcloud and c9 tools:

    source aliases
    installc9tools
    
You will be prompted for your dotcloud username and password.
    
##Step 2 - Create Instance at Dotcloud
Create an instance of the stack at dotcloud using the 'create' and 'push' commands:

    dotcloud create $plonestack
    dotcloud push 
      
##Usage:
Using a web browser, visit your new Plone site at
`http://{yourinstance}-{useraccount}.dotcloud.com` and log in.

For example if your instance is called `zope` and your dotcloud username is
`fooguy`, then the site should be accessible at:

    http://zope-fooguy.dotcloud.com

###Your credentials (admin password)
The following command will retrieve your admin password:

    dotcloud run www cat code/adminPassword.txt

###Zope Server Root

You can always reach the root of the Zope server by visiting
`http://{yourinstance}-{useraccount}.dotcloud.com/_setup_`.

For the example above, the zope root would be:

    http://zope-fooguy.dotcloud.com/_setup_


###View the status of the services

Use the following command to view the status of services:

    dotcloud run www supervisorctl status
    
###Editing the buildout.cfg file

Use the following command to edit the buildout.cfg file:

    dotcloud run www nano buildout.cfg

    
###The Convenience Commands/Aliases (the recommended approach)
This distro ships with some convenient commands for managing your plone based
dotcloud service. Before these commands will work you must initialize them
using the command below:

    source aliases

After the initialization of the aliases you will be able to run the following:

    plonecfg - for editing your remote buildout file with a vim interface
    ploneadminpassword - show the admin password
    plonebuild - runs buildout to build the new configuration
    plonerestart - restarts the remote plone instance
    plonestart - starts the remote plone instance
    plonestop - stops the remote plone instance
    plonestatus - reports on the status of the remote plone instance
    plonepush - pushes a local file to the remote plone instance
    plonedebugon - restarts plone in debug mode
    plonedebugoff - restarts plone in prodoction mode
    plonedevbuild - does a build based on the development.cfg file
    plonedevstart - runs a dev build with sauna.reload enabled (warning locks terminal on cloud9 ide)
    plonedevstop - stops the dev build (will need to launch this on a new terminal
                     as the old terminal will be locked by plonedevstart)
    installc9tools - a script that configures Cloud9 IDE for working with Plone on dotcloud

###Running buildout (the other, slightly more manual approach)

After making changes to buildout.cfg run 'cloudbuildout', using the 
following command:

    dotcloud run www sh current/bin/cloudbuildout 
    
Restart the plone instance to see your changes:

    dotcloud run www supervisorctl restart plone


##Troubleshooting:

Problem: You see '500 Internal Server Error' it is usually because the
instance has not fully started yet 

Solution: (wait 30 seconds and try again).

Problem: You are getting a DNS Spoofing warning someting like this:

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                                                        
@       WARNING: POSSIBLE DNS SPOOFING DETECTED!          @                                                                                                        
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                                                        
The RSA host key for [stackdemo-myaccount.azva.dotcloud.net]:42406 has changed,                                                                                 
and the key for the corresponding IP address [1.2.3.4]:42406                                                                                                 
has a different value. This could either mean that                                                                                                                 
DNS SPOOFING is happening or the IP address for the host                                                                                                           
and its host key have changed at the same time.                                                                                                                    
Offending key for IP in /var/lib/openshift/ec2blahblahfdfa5894/app-root/data//.ssh/known_hosts:5                                                      
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                                                        
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @                                                                                                        
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                                                                        
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!                                                                                                              
Someone could be eavesdropping on you right now (man-in-the-middle attack)!                                                                                        
It is also possible that the RSA host key has just been changed.                                                                                                   
The fingerprint for the RSA key sent by the remote host is                                                                                                         
9e:d3:18:65:df:xx:ff:cf:81:20:xx:89:b2:xx:17:b2.                                                                                                                   
Please contact your system administrator.          

Solution: remove the know_hosts file, this can be done using the following command:

    rm ~/.ssh/known_hosts
    
