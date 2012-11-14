#Plone stack 

##What is this ?
This stack allows you deploy a basic Plone instance to dotcloud.

##What you get
A working Plone Site located at
`{yourinstance}-{useraccount}.dotcloud.com/Plone`

In this boiler plate you will find the basic to get a Plone stack running:
* Use of the dotCoud environment
* wsgi setup
* `getplone.sh` script `dotCloud.yml` a `postinstall script that grabs a set of packages (eggs) known to work on dotcloud and then builds a plone instance.

##Installation:

    instance=instancename
    git clone git@github.com:pigeonflight/stack-python-plone.git $instance
    cd $instance
    dotcloud create $instance
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
