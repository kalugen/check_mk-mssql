#!/bin/bash

# TODO: a lot of things...
#       1) it should be parametric
#       2) it should handle server/agent scenarios
#       3) it should handle install/uninstall
#       4) it should print appropriate warnings (eg. need to install both on Cmk server and ag
#       5) it should detect or ask for paths and user/group instead of hardcoding them
#       5) It should have the option to create both server and agent RPMs

WIPDIR="/tmp/mssql_checks_wip"
CHECKDIR="/usr/share/check_mk/checks"
DOCDIR="/usr/share/doc/check_mk/checks"
TEMPLDIR="/usr/share/nagios/html/pnp4nagios/templates"
PERFDIR="/usr/share/check_mk/web/plugins/perfometer"
WATODIR="/usr/share/check_mk/web/plugins/wato"

echo "MSSQL Checks installation script"

mkdir ${TMPDIR}
cp -v ./checks/* ./data/* ${TMPDIR}/
cp ${CHECKDIR}/mssql_counters ${WIPDIR}/mssql_counters.bck
cat ${TMPDIR}/mssql_counters.orig ${TMPDIR}/mssql_logfile > ${CHECKDIR}/mssql_counters

#cp -v ./checks/* /usr/share/check_mk/checks/
cp -v ./docs/* ${DOCDIR}
cp -v ./templates/*.php ${TEMPLDIR}
cp -v ./perfometer/perfometer_*.py ${PERFDIR}
cp -v ./wato/*.py ${WATODIR}

chown apache:nagios -R ${CHECKDIR}
chown apache:nagios -R ${DOCDIR}
chown apache:nagios -R ${TEMPLDIR}
chown apache:nagios -R ${PERFDIR}

chmod ug+x ${CHECKDIR}/*

service httpd restart

exit 0
