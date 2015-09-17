Create Program information (PFF) file

Introduction

   Program information files (PFF) are used to run applications (data entry and batch edit)
   or tools (tabulate frequencies, sort data, export data, reformat data, compare data, and 
   concatenate data) in production mode. 

   The PFF is a text (ASCII) file which stores the name of the application or tool, the data 
   file(s) to be used, and any runtime parameters specific to the application or tool. The 
   PFF file can then be used as a command line parameter for CSEntry, CSBatch, CSFreq, CSSort, 
   CSExport, CSReFmt, CSDiff, or CSConcat.

   During a data entry application a PFF file is automatically created when you run CsEntry 
   once and placed in the same folder as your data entry application.  The PFF file will have 
   the same name as your application but with extension ".pff".  

   However, you can customize CSEntry’s behavior for any data entry computer by creating your 
   own PFF file using an ASCII editor (such as Notepad or Wordpad), or using the attached programs.  
   You can then use this file as a command line parameter for CSEntry.exe (the associated 
   filename of this executable).  

   For example, if you name your PFF file "MySurvey.pff", then you can launch CSEntry by invoking:

   C:\Program Files\CSPro 6.0\CSEntry.exe  MySurvey.pff

   Using the PFF file you can determine the data entry mode (Add, Modify, or Verify), log the 
   operator identification code, enter the name of the data entry application, enter the name
   of the data file and identify persistent fields, and enter the name of an external file. 
   (See "Run Production Data Entry" help screen for more information).
    

Purpose

   When running CSEntry in production mode, it is recommended that the data entry supervisor 
   monitor the data entry operation keeping track of the batches being keyed and verified. He/she
   should initialize the data entry batch and key the initial batch identification codes.  Using this 
   procedure, the proper data entry application will be presented to the keyer, thus increasing the 
   reliability of the data entry operation.  

   This example demonstrates the use of CSEntry to write a customized PFF file which can then be used 
   as command line parameter when launching data entry for a specific batch of data.  

   The program also maintains the status of the batch in an external lookup file.  If the batch is valid
   the system's date and operator's ID are written to the external file during Add and Verify mode; 
   otherwise the program displays an error message and forces the operator to re-enter the batch ID.

   Once the PFF file is generated you can launch CSEntry for an specific data entry application.  

   NOTE: There are three parts to this example: 
	1. Create the external lookup file (LUF.ENT)
	2. Create the customized PFF file to initialize the data entry screen for the Census Data 
 	   Entry application (NEWPFF.ENT)
        3. Run the PFF file to open up the Census Data Entry application (Census Data Entry.ENT)
           and enter or verify data file. 

   Part 1. - Purpose

   	To create an external lookup file containing the valid batch identification codes.  This file will 
	be used as an external file to check against the codes being added or verified.  

   Part 1. - Task

	Use CSEntry to create an external lookup file of valid batch identification codes. In this example 
	a batch is identified by the Province, District, Village, and EA codes.  The lookup file must also 
	have room to enter the system's date and operator's ID for Add and Verify mode.   

   Part 1. - Files

	Input dictionary: 	LUF.DCF
        Input data file: 	user specified file name.  For this example use LUF.DAT

	Application: 		LUF.ENT
        Type:			Data Entry

   Part 1. - Program

	The data entry application LUF.ENT is used to enter the batch ID codes. The program inserts an "*" 
	at the end of the record to limit the size of the record.  

	Note:  The lookup file set up for this example(luf.dat) contains the following codes as valid 
	control codes (geographic: IDs).
      
	   Province District Village  EA   
	      01       01      001   001
	      01       01      001   001
	      01       01      001   002
	      01       01      001   003
	      01       01      001   004
	      01       01      001   005
	      01       01      001   006
	      01       01      001   007
	      01       01      001   008
	      01       01      001   009
	      01       01      001   010

   Part 2. - Purpose

	To create a customized PFF file to launch CSEntry for an specific data entry application batch in 
	add or verify mode. The PFF data entry application uses an external data file (LUF.DAT) to check 
	valid ID codes. 

	This program customizes a PFF file to:	
		. determine the data entry mode (either Add or Verify)
		. lock a data entry mode (either Add or Verify)
		. log the operator identification code
		. invoke the name of a data entry application (Census Data Entry.ent)
		. generate a name for the data file based on the ID fields (Province, District, Village, EA)
		  (i.e. province=01, district=01, village=001, enumeration area =005 ==> name = 0101001005.dat)
		. initialize the ID fields in the data entry application 

   Part 2. - Task

	Use CSEntry to create a customized PFF file to add or verify a data entry batch for the Census
	Data Entry application.  Use a lookup file to determine if batch is valid.  The PFF file created 
	must open up the data entry application and initialize the ID fields.  

   Part 2. - Files

	Input dictionary:	NEWPFF.DCF
	Input data file:        User specified file name.  You must create two data files: one for adding and 
				another one for verifying. CsPro does not allow to enter duplicate ID codes.                                 

	External dictionary:	LUF.DCF
	External data file:	Name of data file created in Part 1. For this example use LUF.DAT

	Write file: 		User specified file name but MUST have extension .PFF. 

   Part 2. - CsPro Keywords
	
	Function, Loadcase, Mode, Reenter, Concat, Edit, Write, Errmsg
	
   Part 2. - Program

	The data entry application NEWPFF.ENT is used to enter the mode and batch ID codes. These codes are 
	moved to the corresponding ID fields in the Lookup file.  The Loadcase function reads the ID from 
	the external file into memory.  If case is found, the function returns a "1" and calls Function
	ID_FOUND; otherwise it returns a "0" and calls Function ID_NOT_FOUND.  

	The Function ID_FOUND checks the mode. 
		If mode is "A" (Add) then the program checks status of data entry date in lookup file.  
			If data entry date is blank, then 
				The batch has not been entered. The program 
				- generates the data file name based on the ID fields
				- moves the data entry system's date and operator's ID to the lookup file
				- calls Function WRITE_LOOKUP_FILE_DATA to write the PFF file with the parameters
			If data entry date is filled then
				The program displays error message indicating that batch has already been entered 
				and operator is forced to re-enter the ID.
		If mode is "V" (Verify) then the program checks status of verified date in lookup file.
			If verified date is blank, then program checks status of data entry date in lookup file.
				If data entry date is filled then
					The batch has not been verified.  The program 
					- generates the data file name based on the ID fields
					- moves the verified system's date and operator's ID to the lookup file
					- calls Function WRITE_LOOKUP_FILE_DATA to write the PFF file with the parameters
				If data entry date is blank, then
					The program displays error message indicating that batch has not been keyed
					and operator is forced to re-enter the ID. 
			If verified date is filled, then
				The program displays error message indicating that batch has already been verified 
				and operator is forced to re-enter the ID. 

	The Function ID_NOT_FOUND displays an error message indicating that case has not been found and operator is
	forced to re-enter the ID. 	
					
   	The Function WRITE_LOOKUP_FILE_DATA uses a series of WRITE functions to write the PFF file with the 
	parameters entered for Add or Verify mode. 

	NOTE: You can only enter one record each time you run this application. 

	After PFF is created you can run it from Windows Explorer.  The screen will display the Census Data Entry 
	application.  The ID codes will be filled and will match the name of the data file. 

   Part 3. - Files

	Input dictionary: 	Census Dictionary.DCF
	Input file:		File name generated in PFF file
	

   Summary:
	1.	Create external lookup file in LUF.ENT
	2.	Open NEWPFF.ENT. Enter mode and identification codes (only one per application)
  	3.	Close file
 	4.	In Windows Explorer, click on fn.PFF icon to open data entry screens to enter/verify data 
		in Census Data Entry.ENT data entry application
