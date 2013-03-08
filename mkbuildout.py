import string
from random import choice
chars = string.letters + string.digits

# Generate password
password = ''.join(choice(chars) for _ in xrange(10))

# Write password to buildout.cfg and adminPassword.txt
for template in ['buildout.cfg','adminPassword.txt']:
    with open('templates/%s.in' % template, 'r') as infile:
        data = infile.read()
        outfile = open(template,'w')
        outfile.write(data % {'password':password})
