Synchronization in Logic

Purpose: To perform  synchronization of data and program files with a web server and between
		 interviewer and supervisor devices using Bluetooth.  For many cases, synchronization can
		 be done more easily by setting the synchronization options without writing any logic. This
		 application demonstrates synchronization from a menu program which is needed when using Bluetooth
		 or when synchronizing multiple applications/dictionaries at once.

Program: Provides a menu program that launches a simple data entry application and provides options
		 to synchronize with a web server or between tablets using Bluetooth.

Keywords used: syncconnect, syncdata, syncfile, syncdisconnect, syncserver, execpff, getos, setcaselabel

Files:	Menu/Menu.ent: menu program that launches household questionnaire program and performs synchronization.
		Household/HouseholdQuestionnaire.ent: household questionnaire data entry program.
		Dict/Household/HouseholdQuestionnaire.dcf: household questionnaire dictionary shared by both applications.
		Data/HouseholdQuestionnaire.csdat: data file for household questionnaire.
		CreateDeployment.bat: batch file to create .pen files for deployment on Android and to upload to web server.
		Deployment: folder created by the CreateDeployment.bat script to copy to Android device/server.


How to use: 
	. Open Menu.ent data entry application
	. Modify the server URL, username and password in the function syncWithHeadquarters() to match your server and save the file
	. Double click on the file CreateDeployment.bat to generate the Deployment folder
	. Upload the dictionary Household/HouseholdQuestionnaire.dcf to the server
	. Copy the folder Deployment/Synchronization in Logic to the files folder of the web server
	. If running on Android, copy the folder Deployment/Synchronization in Logic to the csentry folder on the Android device
	. Run the menu application, login as interviewer, choose "enter data" and enter some cases
	. Run the menu application, login as supervisor, choose "Sync with headquarters" to synchronize with the web server
	. Run the menu application, on two devices, login as supervisor on one device and choose "Sync with interviewer", 
		login as interviewer on the other device and choose "Sync with supervisor".

	

