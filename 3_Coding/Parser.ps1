$target = "C:\Jason\Log File DEV\Output\Results.csv"

$RunType = 'NA'

$Entity = 0
$JobID = 0
$StartDate = 0
$EndDate = 0
$StartTime = 0
$EndTime = 0

$Warnings = 0
$Errors = 0
$Failed = 0

$EmployeeCount = 0
$TimePerEmployee = 0

$StartDateTime = 0
$EndDateTime = 0
$TimeElapsed = 0

$files = get-childitem "C:\Jason\Log File DEV\Input\" | select Name

foreach($item in $files){
    $temp = $item.Name
    $source = Get-Content "C:\Jason\Log File DEV\Input\$temp"

    for ($i = 0; $i -lt $source.count; $i++) {
        if ($source[$i] -match '(?<TimeStamp1>.+) \*\* Starting job (?<JobID>.+) \(Pay Run\) at (?<TimeStamp2>.+) on (?<Date>.+)') { 
            $JobID = $Matches.JobID
            $StartTime = $Matches.TimeStamp1
            $StartDate = $Matches.Date
        }
        elseif ($source[$i] -match '(?<TimeStamp>.+) - Processing Leave Accrual for Company (?<Entity>.+) - START') {
            $Entity = $Matches.Entity
            $RunType = 'Leave Accrual'
        }
        elseif ($source[$i] -match '(?<TimeStamp>.+) - Processing Payroll for Company (?<Entity>.+) - START') {
            $Entity = $Matches.Entity
            $RunType = 'Payroll Calc'
        }
        elseif ($source[$i] -match '(?<TimeStamp>.+)  - Calculating Employee (?<EmployeeID>.+)') {
            $EmployeeCount++
        }
        elseif ($source[$i] -match '(?<TimeStamp1>.+) \*\* Completed job (?<JobID>.+) \(Pay Run\) at (?<TimeStamp2>.+) on (?<Date>.+)') {
            $EndTime = $Matches.TimeStamp1
            $EndDate = $Matches.Date
        }
        elseif ($source[$i] -match '(?<TimeStamp1>.+) \** Job (?<JobID>.+) \(Pay Run\) Failed at (?<TimeStamp2>.+) on (?<Date>.+)') {
            $EndTime = $Matches.TimeStamp1
            $EndDate = $Matches.Date
            $Failed++
        }

        if ($source[$i] -cmatch 'ERROR') { 
            $Errors++
        }
        elseif ($source[$i] -cmatch 'WARNING') { 
            $Warnings++
        }

    }

    $StartDateTime = [datetime]"$($StartDate) $($StartTime)"
    $EndDateTime = [datetime]"$($EndDate) $($EndTime)"
    $TimeElapsed = new-timespan -Start $StartDateTime -End $EndDateTime
    $TimePerEMployee = $TimeElapsed.TotalSeconds / $EmployeeCount

    "$StartDateTime,$EndDateTime,$RunType,$Entity,$JobID,$EmployeeCount,$($TimeElapsed.TotalSeconds),$TimePerEmployee,$Warnings,$Errors,$Failed" | add-content -Path $target -Encoding UTF8
   
    $RunType = 'NA'
    $Errors = 0
    $Warnings = 0
    $Failed = 0
    $EmployeeCount = 0
}