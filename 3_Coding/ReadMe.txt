Log File Parser Script created to parse log files and collate data as a POC during performance troubleshooting.

PowerShell script parses expressions in the log files which are produced by payroll processes in a Shared Services payroll environment (~300 payruns a fortnight). Statistics such as start and finish times, number of employees paid, time per employee and success/failure are collected and appended to the results.csv output file.

This was created as a quick POC during some performance troubleshooting whereby payroll processing was taking longer than expected. Collating this data allowed us to analyse times for similar runs and determine if there were issues with specific numbers of staff, specific entities or just specific times of the day under concurrent load. After the inital performance troubleshooting work, this POC code was provided to our managed services team and productionised with database storage and dashboard presentations for continued usage.
