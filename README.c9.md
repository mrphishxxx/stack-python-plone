#Plone stack 
These instructions are specific to the Cloud9 IDE platform, and assume that you
start by cloning the github URL.

##Installation on Cloud9 IDE using Clone URL

Create a new instance using the clone URL option and add
the URL 'https://github.com/pigeonflight/stack-python-plone' in the dialog.
The resulting instance

##Preparation (Install Tools)
On *Cloud9 IDE* the following commands will work out of the box:

    source aliases
    installc9tools
    
##Installation:
Create an instance at dotcloud using the following command

    instance=instancename
    dotcloud create $instance

Once your instance has been configured to work with dotcloud you can run
the following command:

    dotcloud push 
      
##Usage:
Using a web browser, visit your new Plone site at
`http://{yourinstance}-{useraccount}.dotcloud.com/` and log in.
Use the following credentials:

    username: admin
    password: admin

For example if your instance is called `zope` and your dotcloud username is
`fooguy`, then the site should be accessible at:

    http://zope-fooguy.dotcloud.com/
    
###Zope Server Root  
    
You can always reach the root of the Zope server by visiting                                                                                                        
`http://{yourinstance}-{useraccount}.dotcloud.com/_setup_`.                                                                                                         
    
For the example above, the zope root would be:                                                                                                                          

    http://zope-fooguy.dotcloud.com/_setup_                                                                                                                         

##View the status of the services

Use the following command to view the status of services:

    plonestatus
    
##Editing the buildout.cfg file

Use the following command to edit the buildout.cfg file:

    dotcloud run www nano buildout.cfg

or to edit with vim

    plonecfg

    
###The Convenience Commands/Aliases (the recommended approach)
This distro ships with some convenient commands for managing your plone based
dotcloud service. Before these commands will work you must initialize them
using the command below:

    source aliases; cat aliases >> ~/.bashrc

After the initialization of the aliases you will be able to run the following:

    plonecfg - for editing your remote buildout file with a vim interface
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

##Running buildout (the other approach)

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
    
