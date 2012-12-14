The following instructions have been tested on cloud9 ide. 
You may have challenges on other platforms.


##Deploy First (Start with an existing deployment)

We assume that you've followed the README or QUICKSTART instructions and have done
an initial deployment using *dotcloud push*

##Install Developer tools
The following commands will install the developer tools including zopeskel and dotcloud

    easy_install pip
    pip install -r requirements.txt
    
Activate aliases

    source aliases

##Create your first package in the 'src' directory

    cd src
    zopeskel dexterity
    

when prompted name it 'dex.example' and accept all defaults
(Using the name 'dex.example' will save you a bit of time
since we already have the required lines commented in
the add-ons.cfg file). Then return to the parent directory

    cd ../
    
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


##Clean Deploy to dotcloud (this will wipe your dotcloud instance)
This step pushes your new dex.example package to dotcloud,
wipes the dotcloud instance and installs a brand new clean
Plone with your package.

    dotcloud push
    
##Deploy on existing instance (deploy without wiping)
This is useful in scenarios where yo don not want to wipe the data from your 
dotcloud service. A common scenario is when you're making quick changes
to your code.

    plonepush src
    plonepush add-ons.cfg
    plonebuild
    plonerestart
    
##Usage:
Visit your Plone site in your web browser at
`http://{yourinstance}-{useraccount}.dotcloud.com/Plone` and log in.
Use the following credentials:

    username: admin
    password: admin

##Browse to the add-ons section and install

In your plone site go to `Site-Setup` > `Add-ons` and install your new package.

