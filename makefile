SCRIPTS = start_theater stop_theater
INSTALLDIR=/usr/local/bin

install: $(SCRIPTS)
	cp ${SCRIPTS} ${INSTALLDIR}	
