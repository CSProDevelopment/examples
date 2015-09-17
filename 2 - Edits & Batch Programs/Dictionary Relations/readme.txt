Use of Relation to link different records, File Statement, Export Statement, and FileWrite Function.

Introduction:

	Relations can be defined in the Data Dictionary to link records and/or items between different record types. 
   
   	The File Statement is used to define files not associated with dictionaries.  The file physical name is specified at
	run time.  

	The Export Statement writes a record to an export file. The file name must be defined in the File Statement. The file
	type must first be specified using the "Set Behavior Export" statement.  A user can export a file to: SPSS; Stata;
	CSPro; Tab, Comma, or SemiColon Delimited; or all of the above.  During export CSPro will create the appropriate
	files. 

	The FileWrite Function writes a line of text to a file specified in the File Statement. It can be used to create
	customized reports.  

Purpose:

	This example shows the use of relations, exporting files, and writing a customized report. The file includes three
	record 	types: Housing, Population, and Fertility information.  The fertility information is only asked for women
	12-49 years old. 

	The relation links the line number (item) in the Fertility record (Primary) to the line number (item) in the
	Population record (Secondary). Once the relation is established, the system writes a customized report including the
	mother's year of birth, the child's year of birth, and the calculated age of the mother at time of birth.  The report
	is printed in separate pages according to serial number.  

	In addition, the program exports selected records and variables to an external CSPro file.  The system automatically
	created the corresponding data dictionary file. 

Files:

	Application: Rel_Ex.bch
    	Type: Batch
    
    	Input dictionary: Rel_Ex.dcf
    	Input data file: Test.dat
    	Customized report: Age_Mother.rep
  
  	Export dictionary: Child.dcf
    	Export data file: Child.dat

CSPro commands/keywords:

	File, Set Behavior() Export, Export To, Filewrite

Program:

   	In the data dictionary, edit menu, establish the relation using as Primary file the Fert record type and 
	as Secondary file the Pop record type.  Link the records using the person identification field in each record:
	woman_number in the Fert and line_number in the Pop. 

	Before using Export or Filewrite, you must first declare the name of the files under PROC GLOBAL.  In this example 
   	we are using files File_Child to export selected variables to external file and Age_Mother to write a customized
	report.

	Before exporting data, you must first declare the format of the exported file using the SET BEHAVIOR() EXPORT. In
	this example we are exporting selected variables from the POP and FERT records in a CSPro format. The name of the
	file Child.dat) is entered at run time. After the application is run, the system automatically creates the data
	dictionary (Child.dcf) for that file. 
   
   	To create the customize report we first write the title, heading and page number.  This information will appear once
	in every page according according to the serial number range. We use the command FOR to loop through the relation
	defined in the data dictionary.  If the person identification number (woman_number and line_number) is the same, then
	we calculate the age of the mother at time of birth, and we write the information for each child born. The name of
	this report (Age_Mother.rep) is entered at run time.      
