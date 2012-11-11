import sys
sys.path.append('/home/dotcloud/current')
import os
from paste.deploy import loadapp
#current_dir = os.getcwd()
application = loadapp('config:production.ini', relative_to=current_dir)

