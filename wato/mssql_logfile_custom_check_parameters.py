register_check_parameters(
    _("Applications, Processes & Services"),
    "solaris_ldom_stat",
    _("MSSQL Log file usage"),
    Dictionary(
        elements = [
            ("usage_levels",
                Tuple(
                    title = _("Levels for log usage (%)"),
                    label = _("Levels for log usage (%)"),
                    elements = [
                        Percentage(title = _("Warning at:" ), maxvalue = 1500.0),
                        Percentage(title = _("Critical at:"), maxvalue = 1500.0),
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