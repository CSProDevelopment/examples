SelCase Function

    The SelCase function gives the ability to search files given a set of selection criteria.

Purpose

    This example demonstrates several uses of the SelCase function such as
    searching on a key or partial key, searching for a specific name, or searching
    based on some other type of criteria.

    This program references a file containing information about enumerators. 
    The file contains the enumerator's code, name, region, address, phone number,
    and other information about the enumerator.

 
Task


    Use the SelCase function to find a case by searching for:

        1.	the enumerator's code or the first digits of the code.
        2.	an enumerator with a specific last name.
        3.	an enumerator with a specific first name.
        4.	the first portion of the enumerator's last name.
        5.	a specific string contained within the first or last name.
        6.	enumerators in a specific region whose wages are less than beyond accepted limits.
        7.	enumerators with a specific last name (the give the ability to select more than 1.)


Files

  Input:
    Dictionary:	Enumerator Information.dcf
    File:		Enumerator Information.dat  (contains information about each enumerator)
                             


  Input/Output:

    Dictionary:	SelCaseX.dcf
    File:		Use specified
                Placeholder file required by CSPro.  
                This file sets up the parameter input screen used by the SelCase command.
                The example uses: Test.dat

  Output:
    Dictionary:  None (Outputs are display using the Errmsg command).



CSPro commands/keywords

    errmsg, for/do/enddo, length, pos, reenter, SelCase, strip, tonumber
    string [x:y] (see SUBSTRING EXPRESSIONS in the helps)

Program

    The program demonstrated a variety of options with the SelCase command.
    The operated enters a "dummy" ID, after which a menu is display to demonstrate
    7 possible variationS in using the SelCase command.  The screen has two entry fields.
    The first, "Selection Data" is used to enter data for matching against
    the enumerator information file.  The second, "SelCase option" is the menu 
    selection entry to determine which option to run.

    The STRIP command is often used to remove extraneous blanks from the data entered
    in the "Selection Data" field.

    Option 1.

        Uses the key-prefix parameter of the SelCase function search for enumerators
        whose key match the key-prefix.  The enumerator code here is three digits.
        For example, if only one digit is entered, the selection window will display
        all cases in which the first digit of the enumerator code matches that digit.

    Option 2

        Uses the Where parameter of the SelCase function to search for enumerators with
        a specific last name.  If one or more are found the selection window is displayed
        and the operator can select the appropriate one.


    Option 3

        Uses the Where parameter of the SelCase function to search for enumerators with
        a specific first name.  If one or more are found the selection window is displayed
        and the operator can select the appropriate one.

    Option 4

        Uses the Where parameter of the SelCase function to search for enumerators whose
        last name begins with the same string as the string specified in the selection data. 
        This is done by first finding the length of the string entered in the selection window:

            StringLength = length(strip(SELECTION_DATA))

        The program then makes use of the Substring capability of CSPro to make
        equivalent strings of the enumerator's last name in the data file
        and the string entered in the selection data:

           LAST_NAME[1:StringLength] <= is compared with => strip(SELECTION_DATA[1:StringLength])

        If one or more are found the selection window is display the operator can select
        the appropriate one.


    Option 5

        Uses the Where parameter of the SelCase function to search for enumerators
        whose first or last name contains the same string as the string specified
        in the selection data.  The program uses the POS command to find the string.
        If the string is not found the POS command will return a value of 0, otherwise,
        the command will return a value greater than 0 indicating the position the
        string was found.  This value is used in the Where clauses to determine if
        the string was found.

    Option 6

        Uses the Where parameter of the SelCase function to search for enumerators
        in the region specified in the selection data whose wages are outside the
        accepted range of 5.00 to 8.99.

        Since the selection data field is an alpha field the program uses the
        ToNumber function to convert it to numeric.

        If the selection data is not numeric the ToNumber function returns a value
        of "default" and a message is displayed.

        The length of the region code must be 2 digits so the program uses the
        LEN function to assure the entry is 2 digiits.

    Option 7

        Demonstrates the use of the multiple parameter.  Specifying this parameter allows
        several items to be selected in the selection window.  The program uses the 

            for ext-dict-name do
     	         code;
                  …
            enddo;

        structure to loop through the select items in the selection window.  This loop
        executes for only the selected items.
