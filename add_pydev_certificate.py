#!/usr/bin/env python
# add PyDev's certificate to Java's key and certificate database
# Certificate file can be downloaded here : http://pydev.org/pydev_certificate.cer
# installation steps: http://www.pydev.org/manual_101_install.html
import os, sys
import pexpect

print "Adding pydev_certificate.cer to /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/cacerts"

cwd = os.path.abspath (os.path.dirname(sys.argv[0]))
#java path can be found in eclipse/preference/Java/Installed JREs
child = pexpect.spawn("keytool -import -file ./pydev_certificate.cer -keystore /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/cacerts")
child.expect("Enter keystore password:")
child.sendline("changeit")
if child.expect(["Trust this certificate?", "already exists"]) == 0:
    child.sendline("yes")
try:
    child.interact()
except OSError:
    pass

print "done"

