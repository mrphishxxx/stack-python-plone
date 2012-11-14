#Plone stack 

##What is this ?
This stack allows you deploy a basic Plone instance to dotcloud.

##What you get
In this boiler plate you will find the basic to get a Plone stack running:
* Use of the dotCoud environment
* wsgi setup
* `getplone.sh` script `dotCloud.yml` a `postinstall script that grabs a set of packages (eggs) known to work on dotcloud and then builds a plone instance.

##Usage:
 
  instance=instancename
  git clone git@github.com:pigeonflight/stack-python-plone.git
$instance
  cd $instance
  dotcloud create $instance
  dotcloud push 
  
##
