Log File Parser Script created to parse log files and collate date as a POC during performance testing.

PowerShell script parses expressions in the log files which are produced by payroll processes in a Shared Services payroll environment. Statistics such as start and finish times, number of employees paid, time per employee and success/failure are collected and appended to the results.csv output file.

This was created as a quick POC during some performance troubleshooting whereby payroll processing was taking longer than expected. Collating this data allowed us to compare times for similar runs and determine where the were. After the inital performance troubleshooting work, this POC code was provided to our in-house managed services team and productionised with database storage and dashboard presentations for continued usage.
