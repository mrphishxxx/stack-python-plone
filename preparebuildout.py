import time
from Cheetah.Template import Template
f = open('buildout.cfg', 'w')

hour = time.localtime() [3]
output = Template ( file = 'test.tmpl', searchList = [{ 'hour':
    hour }] )
import pdb;pdb.set_trace()
print "blah"

