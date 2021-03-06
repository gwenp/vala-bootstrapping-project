#!/bin/sh
#a simple script to rename a libtoolized vala project

#clean project just in case 
make distclean

perl -p -i -e 's/Bootstrapingproject/Yourprojectname/g' `ack-grep -f --vala`
perl -p -i -e 's/bootstrapingproject/yourprojectname/g' `ack-grep -f --vala`

#replace shelf by shelfPanel in Makefile.am and configure.ac
perl -p -i -e 's/Bootstrapingproject/Yourprojectname/g' configure.ac
perl -p -i -e 's/bootstrapingproject/yourprojectname/g' configure.ac
perl -p -i -e 's/BOOTSTRAPINGPROJECT/YOURPROJECTNAME/g' configure.ac

perl -p -i -e 's/Bootstrapingproject/Yourprojectname/g' Makefile.am
perl -p -i -e 's/bootstrapingproject/yourprojectname/g' Makefile.am
perl -p -i -e 's/BOOTSTRAPINGPROJECT/YOURPROJECTNAME/g' Makefile.am

perl -p -i -e 's/Bootstrapingproject/Yourprojectname/g' src/Makefile.am
perl -p -i -e 's/bootstrapingproject/yourprojectname/g' src/Makefile.am
perl -p -i -e 's/BOOTSTRAPINGPROJECT/YOURPROJECTNAME/g' src/Makefile.am

perl -p -i -e 's/Bootstrapingproject/Yourprojectname/g' lib/Makefile.am
perl -p -i -e 's/bootstrapingproject/yourprojectname/g' lib/Makefile.am
perl -p -i -e 's/BOOTSTRAPINGPROJECT/YOURPROJECTNAME/g' lib/Makefile.am

#man dir
perl -p -i -e 's/Bootstrapingproject/Yourprojectname/g' man/Makefile.am
perl -p -i -e 's/bootstrapingproject/yourprojectname/g' man/Makefile.am
perl -p -i -e 's/BOOTSTRAPINGPROJECT/YOURPROJECTNAME/g' man/Makefile.am

perl -p -i -e 's/Bootstrapingproject/Yourprojectname/g' man/bootstrapingproject.1
perl -p -i -e 's/bootstrapingproject/yourprojectname/g' man/bootstrapingproject.1
perl -p -i -e 's/BOOTSTRAPINGPROJECT/YOURPROJECTNAME/g' man/bootstrapingproject.1

mv man bootstrapingproject.1 yourprojectname.1

#doc dir
perl -p -i -e 's/Bootstrapingproject/Yourprojectname/g' docs/Makefile.am
perl -p -i -e 's/bootstrapingproject/yourprojectname/g' docs/Makefile.am
perl -p -i -e 's/BOOTSTRAPINGPROJECT/YOURPROJECTNAME/g' docs/Makefile.am

cd lib
mv 'bootstrapingproject.deps.in' 'yourprojectname.deps.in'
mv 'bootstrapingproject.gresource.xml' 'yourprojectname.gresource.xml'
mv 'bootstrapingproject.pc.in' 'yourprojectname.pc.in'

echo renaming done. Run \"autoreconf -fi\" to reconfigure your project
