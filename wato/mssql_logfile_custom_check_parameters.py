register_check_parameters(
    _("Applications, Processes & Services"),
    "mssql_percent_log_used",
    _("MSSQL Log file usage"),
    Dictionary(
        elements = [
            ("log_usage_levels",
                Tuple(
                    title = _("Levels for log usage (%)"),
                    label = _("Levels for log usage (%)"),
                    elements = [
                        Percentage(title = _("Warning at:" ), maxvalue = 15000.0),
                        Percentage(title = _("Critical at:"), maxvalue = 15000.0),
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