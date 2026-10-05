# This script is titled "checker script". It checks the User's downloads folder for any new files within the last 24 hours. 
# If any new files are detected, it'll take the "Name" and the "LastWriteTime" property of the file to show when it was last added/written.
 
# Infinite while loop.
while ($true){
    # Prompts user input using Write-Host and a $choice variable with Read-Host. 
    Write-Host "This script checks if anything new (in the last 24 hours) has been added in the downloads folder, and shows what it is and the last write time."
    $choice = Read-Host "Do you want to check if anything new has been added in the last 24 hours? (y/n) "

    # If-elseif-else statement: 
    if($choice -eq 'y'){
        # If user input is equal to "y", the "checker script" executes. 
        Write-Host "The following files have been added in the last 24 hours: "
        # This part of the script makes a variable ($currentDate) and uses the Get-Date cmdlet to store the date. 
        $currentDate = Get-Date 
        # This part of the script makes a varaible ($compareTime) and subtracts 24 hours from the $currentDate variable.
        $compareTime = $currentDate.AddHours(-24)
        # This part of the script lists the files in the downloads folder,
        # Then pipes them to the Where-Object cmdlet, where the current object's ".LastWriteTime" property is compared to the $compareTime variable,
        # Then selects the "Name" and "LastWriteTime" properties and pipes it to the Format-Table cmdlet and formats it to a table based upon those properties.
        Get-ChildItem -Path "$env:USERPROFILE\Downloads" | Where-Object { $_.LastWriteTime -gt $compareTime } | Select-Object -Property Name, LastWriteTime | Format-Table Name , LastWriteTime
    }
    elseif($choice -eq 'n'){
        # If the user input is equal to "n", the "checker script" terminates because of "exit".
        exit
    }
    else{
        # If the user input is equal to something invalid like "asdf;jkl;" or any gibberish of the sort, the script tells the user that their input is invalid. 
        # They then will be redirected to the start.
        Write-Host "Invalid Input!"
    }

}


