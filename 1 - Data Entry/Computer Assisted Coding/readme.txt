Computer Assisted Coding

Purpose: to enter occupational and industry codes using a text-matching system. The matches are displayed on a window, the
         operator selects the appropriate option, and the program inserts the corresponding code.    

Program: it displays an auxiliary window (AUXIL_FF) to enter "key" text (min 3 characters) for occupation or industry data
         file. Program displays window with records matching the selection.  Once the selection is made, the system inserts
         corresponding code.

Keywords used: endgroup, enter, selcase, loadcase, length, curocc

Files:	CheckCode.ent
		Input dictionary: checkcode.dcf
		Input file: test.dat (or create your own)
		External dictionary: occupation.dcf
		External file: occ.dat
		External dictionary: industry.dcf
		External file: ind.dat

	Auxil.ent
		Auxiliary dictionary: auxil.dcf
		Auxiliary file: auxil.dat (or create your own)

How to use: 
	. Open CheckCode.ent data entry application
	. Enter blank in occupation and/or industry fields to display auxiliary form
	. In auxiliary form enter code of 1 for occupation or 2 for industry
	. Enter matching "key" text (minimum 3 characters) to display window matching the selection
	. Using scroll bar, select appropriate entry. Application will insert corresponding code and exit auxiliary form.

