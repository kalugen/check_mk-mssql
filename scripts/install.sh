#!/bin/bash

# TODO: a lot of things...
#       1) it should be parametric
#       2) it should handle server/agent scenarios
#       3) it should handle install/uninstall
#       4) it should print appropriate warnings (eg. need to install both on Cmk server and ag
#       5) it should detect or ask for paths and user/group instead of hardcoding them
#       5) It should have the option to create both server and agent RPMs

CHECKDIR="/usr/share/check_mk/checks"
DOCDIR="/usr/share/doc/check_mk/checks"
TEMPLDIR="/usr/share/nagios/html/pnp4nagios/templates"
PERFDIR="/usr/share/check_mk/web/plugins/perfometer"
WATODIR="/usr/share/check_mk/web/plugins/wato"

CMKUSER="apache"
CMKGROUP="nagios"

echo "MSSQL Checks installation script"

cp -v ./checks/* ${CHECKDIR}
cp -v ./docs/* ${DOCDIR}
cp -v ./templates/*.php ${TEMPLDIR}
cp -v ./perfometer/perfometer_*.py ${PERFDIR}
cp -v ./wato/*.py ${WATODIR}

for __DIR in ${CHECKDIR} ${DOCDIR} ${TEMPLDIR} ${PERFDIR} ${WATODIR}; do
  chown ${CMKUSER}:${CMKGROUP} -R ${__DIR}
  chmod ug+x ${__DIR}
done

service httpd restart

exit 0
