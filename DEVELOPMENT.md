The following instructions have been tested on cloud9 ide. 
You may have challenges on other platforms.


#Start by installing everything

Follow the README or QUICKSTART instructions then come back here

##Install Developer tools

    easy_install pip
    pip install -r requirements.txt

##Create your first package in the 'src' directory

   cd src
   zopeskel dexterity

when prompted name it 'dex.example' and accept all defaults

##Edit the add-ons.cfg file
Add your new package to the add-ons.cfg file

    [buildout]
    extensions += mr.developer buildout.dumppickedversions
    auto-checkout = 
    #             your.package
                  dex.example
    eggs += 
    #             your.package
                  dex.example
    [sources]
    # assumes that packages are added to the src/ directory
    # your.package = fs your.package
    dex.example = fs dex.example


##Deploy to dotcloud (this will wipe your dotcloud instance)

    dotcloud push

##Usage:
Visit your new Plone site in your web browser at
`http://{yourinstance}-{useraccount}.dotcloud.com/Plone` and log in.
Use the following credentials:

    username: admin
    password: admin

##Browse to the add-ons section and install

In your plone site go to `Site-Setup` > `Add-ons` and install your new package.

