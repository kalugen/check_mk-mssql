register_check_parameters(
    _("Applications, Processes & Services"),
    "mssql_processes_blocked_counters",
    _("MSSQL Blocked Processes"),
    Dictionary(
        elements = [
            ("num_blocked",
                Tuple(
                    title = _("Number of Blocked Processes"),
                    label = _("Number of Blocked Processes"),
                    elements = [
                        Integer(title = _("Warning at:" ), maxvalue = 15000),
                        Integer(title = _("Critical at:"), maxvalue = 15000),
                    ]
                ),
            ),
        ],
    ),
    TextAscii(
        title = _("Database Name"),
        help  = _(""),
        allow_empty = True,
    ),
    "dict"
)

register_rule("checkparams" + "/" +  _("Inventory - automatic service detection"),
    # This is the name of the variable that this rule will populate
    # THE VARIABLE MUST BE DECLARED ALSO IN THE CHECK, wher it will be used
    # in the inventory function
    varname     = "unwanted_sql_dbs",
    # Label for the variable
    title         = _("SQL Server counters discovery"),
    # Structure of the data the variable will hold
    valuespec = ListOf(
        TextAscii(
            title = _("Database"),
            help  = _( "Name of the database that you want to ignore" ),
            default_value = "_Total",
        ),
        movable = False,
        title = _("List of DBs to ignore")
    ),
    match= 'all',
)