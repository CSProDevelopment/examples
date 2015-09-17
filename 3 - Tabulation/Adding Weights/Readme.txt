Note: this folder contains three CSPro applications, 
one to create a data file containing weight values, 
a second to add weight values to a survey data file and, 
a third showing the use of weights in a CSPro Tabulation.

1) Create Weight Data File
2) Add Weight values to case
3) Produce Weighted Tables

Introduction:
Most survey data is ‘weighted’ so that derived estimates from survey reflect 
the whole population.  For example, one housing unit in a survey may be assigned 
a weight of 5 meaning that this one unit represents five ‘similar’ units in the survey.  
Another housing unit may only have a weight of 2.

Weights quite often have decimal places and are assigned by geographical area. 
They are calculated based on the sample selection process and number of units sampled.  
In most cases the weights are calculated after the data has been collected and captured.  
So the task is to assign each case [or, if appropriate, record] with its correct weight.

Different weights can be assigned to
- each individual record in a case 
- each case 
- any grouping of cases as long as the grouping identifiers are available for each case.

The grouping of cases and determination of weight values are outside the scope of CSPro.

In this example assume that weight values are assigned to cases based on geography, 
specifically Province and District codes.  


1) Create Weight Data File

Purpose: A CSPro data entry application to capture the weight values 
for each combination of Province and District.

Program: None

Files:
Data Entry Application:
    Create Weights.ent and associated files

Input Data Dictionary: 
    Weight File.dcf

Input data: 
    Some non-electronic listing of weight values by Province and District codes.
    Example:
    Prov Dist Weight
    01    01   1.2345
    01    02   3.4567
    01    03   5.6789
    
Output data:
    WeightEx.dat  [weight values with 4 implied decimals]
    
2) Add Weight values to case
       
Purpose: A CSPro batch application to add weights to an existing data file 
[cases have already been keyed]. 
      
Program: Logic associates Province and District codes for a case with an external data file 
(WeightEx.dat) containing Province and District codes plus the assigned weight.  
For each case, if codes are found in external file, the associated weight is added 
at the end of the housing record; if codes are not found the system displays an error message.  
Application requires name of output file which will contain cases with the weights added 
to the end of the house record. [This item is blank in the input data file] 

Keywords used: loadcase, errmsg 

Files: 	
Batch application: 
    Add-weight.bch and associated files

Dictionaries: 
    Primary: Popstan.dcf
    External: Weight file.dcf

Data Files:
    Primary Input: PopstanEx.dat
    External Input: WeightEx.dat
    Primary Output: PopstanEx.out 

Auxilary Files.
    Report file: Add-Weight.lst 


3) Produce Weighted Tables

Purpose: Tabulate an example of weighted and unweighted tabulations.

Program: None

Concept: Open Cross Tabulation application (Pop-tabs.xtb). 
For weighted tabulations:
Open "Parameter" window, 
Drag the Weight Item ["Case weight" at end of House Record] to the "Weight" field,
Run weighted data file to create weighted estimates for the entire population.

Files:
Cross Tabulation Application:
    Weighted Tables.xtb and associated files

Input Data Dictionary: 
    Popstan.dcf

Input data: 
    PopstanEx.out
    
Output Tables [for use with Table Viewer]:
Table Counts - weighted and unweighted.tbw
