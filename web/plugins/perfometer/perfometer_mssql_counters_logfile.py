def perfometer_mssql_counters_logfile(row, check_command, perf_data):
    perc = float(perf_data[0][1])

    h = '<table><tr>'
    h += perfometer_td(perc, "#69EA96");
    h += perfometer_td(100 - perc, "#ffffff");
    h += '</tr></table>'
    return "%.1f%%" % perc, h

perfometers["check_mk-mssql_counters.logfile"] = perfometer_mssql_counters_logfile
