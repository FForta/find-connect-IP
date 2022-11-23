@echo OFF
setlocal enableextensions enabledelayedexpansion

: main 
	ECHO "Is the router IP 10.10.4.1 (Default) y/n"
	SET /p YESNO= ""
	if "!YESNO!" == "y" (	
	set IPADDRESS= 10.10.4.1
	)

	if "!YESNO!" == "n" (
	ECHO "Please input IP address of the router you wish to connect"
	SET /p IPADDRESS= ""

	)

	if NOT "!YESNO!" == "y" (if NOT "!YESNO!" == "n" (
		ECHO "INPUT NOT RECOGNIZED PLEASE PUT IN EITHER 'y' or 'n'" 
		goto main
	))

	ECHO "How many times would you like to attempt to connect?"
	SET /p pingAttempts= ""		

	for /l %%x in (1,1,!pingAttempts!) do (
	
		ping -n 1 !IPADDRESS! | find "TTL=" >nul
	
		IF NOT errorlevel == 1 (
			ECHO "%IPADDRESS% found after %%x tries"
    			start chrome "https://%IPADDRESS%" --ignore-certificate-errors
			PAUSE
   			 exit
		)
	ECHO "!IPADDRESS! still not found after %%x tries"
	)

ECHO "Could not connect to printer after %pingAttempts% attempts"
PAUSE
exit

	





	






