The following instructions have been tested on cloud9 ide. 
You may have challenges on other platforms.


#Start by installing everything

Follow the README or QUICKSTART instructions then come back here

##Install Developer tools

    easy_install pip
    pip install -r requirements.txt

This includes all the developer tools including zopeskel and dotcloud

##Create your first package in the 'src' directory

    cd src
    zopeskel dexterity

when prompted name it 'dex.example' and accept all defaults
(Using the name 'dex.example' will save you a bit of time
since we already have the required lines commented in
the add-ons.cfg file)

##Edit the add-ons.cfg file
Add your new package to the add-ons.cfg file, it should look like this:

    [buildout]
    extensions += mr.developer buildout.dumppickedversions
    auto-checkout = 
                  dex.example
    eggs += 
                  dex.example
    [sources]
    # assumes that packages are added to the src/ directory
    dex.example = fs dex.example


##Deploy to dotcloud (this will wipe your dotcloud instance)
This step pushes your new dex.example package to dotcloud
wipes the dotcloud instance and installs a brand new clean
Plone with your package.

    dotcloud push

##Usage:
Visit your new Plone site in your web browser at
`http://{yourinstance}-{useraccount}.dotcloud.com/Plone` and log in.
Use the following credentials:

    username: admin
    password: admin

##Browse to the add-ons section and install

In your plone site go to `Site-Setup` > `Add-ons` and install your new package.

