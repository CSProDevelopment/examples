Example Labor Force Survey
==========================

This is an example labor force survey designed for CAPI data collection on
mobile devices.

There are two CSPro applications used in this survey:

* PopstanLFS: the survey questionnaire application
* Menu: a menu program for interviewers and field supervisors to manage the
survey process


Workflow
--------
The Popstan Labor Force Survey workflow is based on a few assumptions:

- CSEntry has been installed on all mobile devices
- The Popstan Labor Force Survey project has been deployed to all devices
- Supervisors will have access to the Internet, but interviewers will not

Synchronizations between the supervisor and headquarters will occur over the
Internet. However, synchronizations between the supervisor and interviewer will
occur over the Bluetooth protocol.


Preparing the staff and sample files
------------------------------------

All supervisors and interviewers are assigned a code and a role (interviewer or
supervisor). The lookup data file Staff.csdb contains the code, name and role
of each staff member.

All households to be interviewed must first be added to the Sample.csdb lookup
file. Interviewers will choose from the sample households when starting an
interview. The sample file also contains the assignments of households to
interviewers and supervisors.

To update the staff and sample files, edit the corresponding Excel spreadsheet
(Staff.xlsx or Sample.xlsx) and then use the CSPro2Excel tool to convert the
spreadsheet to a CSPro data file. CSPro2Excel scripts (CreateStaffFromExcel and
CreateSampleFromExcel) are provided for this purpose.

The initial versions of the staff and sample files will be deployed with the
application itself. Once interviewers are in the field, these files will be
updated using data synchronization. Upload the updated staff and sample files
to Dropbox using the DataViewer tool and the next time the supervisor
synchronizes with headquarters they will download it. When the supervisor then
synchronizes with the interviewer over Bluetooth the files will be updated on
the interviewers device.


Deploying the applications
--------------------------

To deploy the applications to a mobile device, run the deployment script
DeployPopstanLFS.csds. This will generate a folder named DeployLaborForceSurvey
containing all the required files. Simply copy this folder to the CSEntry
folder of the mobile device.


Running the applications
------------------------

Interviewers and supervisors must first login to the application using the
staff code from the staff file. This automatically loads their assignments from
the sample file. The interviewer then selects the households to interview from
the households that they have been assigned.

Once the interviewers have collected data for several households they will
synchronize with the supervisor. All newly collected household data will be
sent to the supervisor.

Having synchronized with each interviewer the supervisor will travel to an area
where they have access to the Internet. The supervisor then synchronizes with
headquarters sending all data from the interviewers to the central server. For
this application, Dropbox will be our central server but it can be changed to
another server by modifying the syncconnect(Dropbox) call in the menu program.

Use DataViewer to download the combined data file from the server that contains
the data sent from all the supervisors.


Editing the application
-----------------------

The variable names are very short so it may be helpful to use the "append
labels to names in tree" option in the view menu to see the more descriptive
labels.

The questionnaire was designed to be modular. To make it easier to skip
modules, "dummy" variables have been added to the dictionary and forms to mark
the start and end of each module. For example, the employment module has the
variables EMPSTART and EMPEND. These variables are all protected so the
interviewer never sees them. They are used as targets for skip commands. To
disable a module, you can can simply logic to the preproc of the start module
variable to skip to the end module variable. This design makes it easier to
disable modules if they are not needed for a particular population.
