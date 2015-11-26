# MSSQL Checks

Aggiungiamo vari check sui contatori MSSQL come da richiesta dei DBA.

## Check creati

Questi sono i singoli check implementati in questo package. Per tutte le metriche
che vengono riportate per singolo DB, le righe relative a "_Total" e
"mssqlsystemresource" vengono ignorate automaticamente. Tutti i check che
lavorano a livello di singolo DB, supportano una singola regola di inventory
che scarta automaticamente i due item.

### process_blocked

General Statistic per l'istanza, un solo check creato per istanza. Soglie fisse
(no media, counter, predictive), ma la specifica dei DBA recita:

> è necessario che appena vi è un processo bloccato per più di 5 minuti sia
> aperto un warning e dopo 15 minuti un critical

Questo comportamento deve essere implementato su Nagios/BSM

### percent_log_usage

Cattura della metrica così come è riportata da SQL Server: un valore per ogni DB
gestito da ogni istanza, quindi creiamo 1 check per ogni coppia Istanza/DB.

Nessuna soglia, utile solo per i perfdata.

### active_transactions

Cattura della metrica così come è riportata da SQL Server: un valore per ogni DB
gestito da ogni istanza, quindi creiamo 1 check per ogni coppia Istanza/DB.

Nessuna soglia, utile solo per i perfdata.

### temp_table_creation_rate

General Statistic per l'istanza, un solo check creato per istanza. Nessuna
soglia, utile solo per i perfdata.