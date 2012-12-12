#Plone stack 

##What is this ?
This stack allows you to deploy a basic Plone instance to dotcloud. This configuration is not recommended for deployments and is 
currently most suited for development (hopefully, this will change in the future).

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

##Installation:

    instance=instancename
    git clone git://github.com/pigeonflight/stack-python-plone.git $instance
    cd $instance
    dotcloud create $instance

Once your instance has been configured to work with dotcloud you can run
the following command:

    dotcloud push 
  
##Usage:
Visit your new Plone site at
`http://{yourinstance}-{useraccount}.dotcloud.com/Plone` and log in.
Use the following credentials:

    username: admin
    password: admin

For example if your instance is called `zope` and your dotcloud username is
`fooguy`, then the site should be accessible at:

    http://zope-fooguy.dotcloud.com/Plone
    

##Troubleshooting:

Problem: You see '500 Internal Server Error' it is usually because the
instance has not fully started yet 

Solution: (wait 30 seconds and try again).

##View the status of the services

Use the following command to view the status of services:

    dotcloud run www supervisorctl status
    
##Editing the buildout.cfg file

Use the following command to edit the buildout.cfg file:

    dotcloud run www nano buildout.cfg

##Running buildout

After making changes to buildout.cfg run 'cloudbuildout', using the 
following command:

    dotcloud run www sh current/cloudbuildout 
    
Restart the plone instance to see your changes:

    dotcloud run www supervisorctl restart plone
    
##Todo:

[ ] Add a custom script that can generate an egg bundle for distribution with the getplone.sh script

[x] Make running buildout easier

[ ] Make it easier to create a new development package (in progress, added zopeskel and a src directory)

[ ] Add sauna.reload
