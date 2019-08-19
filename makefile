SCRIPTS = theater
INSTALLDIR=/usr/local/bin

install: $(SCRIPTS)
	cp ${SCRIPTS} ${INSTALLDIR}	
