#!/bin/bash

# Setup the work parameters
SOURCEDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

CHECKDIR="/usr/share/check_mk/checks"
DOCDIR="/usr/share/doc/check_mk/checks"
TEMPLDIR="/usr/share/nagios/html/pnp4nagios/templates"
PERFDIR="/usr/share/check_mk/web/plugins/perfometer"
WATODIR="/usr/share/check_mk/web/plugins/wato"

USER="apache"
GROUP="nagios"

CHECKNAME=$(ls -1 ${SOURCEDIR}/checks/* | head -n1)

# Start
echo "Generic CheckMK checks uninstallation script"

# Remove our files
rm ${CHECKDIR}/${CHECKNAME}*
rm ${DOCDIR}/${CHECKNAME}*
rm ${TEMPLDIR}/${CHECKNAME}*.php
rm ${PERFDIR}/perfometer_${CHECKNAME}.py
rm ${WATODIR}/${CHECKNAME}_rules.py
rm ${AGENTPLUGINSDIR}/${CHECKNAME}

exit 0