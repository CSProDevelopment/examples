Requirements of the Popstan Census Workflow

	The Popstan Census workflow has the following prerequisites:
	- CSEntry has been installed on all devices
	- The Popstan Census project has been deployed to the server and all devices
	- A Dropbox account has been created to be shared by all supervisors and interviewers
	- Supervisors will have access to the Internet, but interviewers do not require Internet

	Synchronization between the supervisor and headquarters will occur over the Internet. However,
	synchronization between the supervisor and interviewer will occur over the Bluetooth protocol.


Overview of the Popstan Census Workflow

	When the supervisor and interviewers receive their devices, they will have no data other than
	the geography codes (geocodes). The interviewers will need to wait for the supervisor to finish
	their setup process before they can begin.

	The supervisor will start by entering the supervisory password and then creating their pin and
	username. The supervisor then selects their supervisory area, creates usernames for the
	interviewers, and assigns enumeration areas to the usernames. The supervisor then synchronizes
	with each interviewer. All usernames and assignments for the supervisory area will be sent to
	the interviewers over the Bluetooth protocol.

	The interviewers log in by selecting their username and then creating a pin. The interviewer
	then selects their assignment and can begin enumerating households. Once the interviewers have
	collected data for several households they will synchronize with the supervisor. All newly
	collected household data will be sent to the supervisor over the Bluetooth protocol.

	Having synchronized with each interviewer the supervisor will travel to an area where they have
	access to the Internet. The supervisor then synchronizes with headquarters sending all
	usernames, assignments, and household data in the supervisory area to the central server. For
	demonstration purposes Dropbox will act as the central server in Popstan. However, for a census
	CSWeb would be a more appropriate solution, because it has been optimized for CSPro data
	synchronizations.


Popstan Census Quickstart

	The following section is meant to get you up and running with the Popstan Census as quick as
	possible. Supervisor and interviewer usernames have been created and given assignments. Data
	for three houses have been collected.

	Deploy Locally:
	- Double-click DeployPopstanCensus.pff
	- The folder DeployPSC/ will be created with three subfolders (Data/, Household/, and Menu/).
		The deployed applications will run on both Windows and Android.

	Launch Menu Application on Windows:
	- Double-click Menu.pff from DeployPSC/Menu/

	Log in as Supervisor:
	- At the Login menu select SUPER01 and enter pin 1234
	- At the Assignment Selection menu there will be one assignment
	- Select assignment "Supervise: Matanga (11) / Kariba (09)"
	- This will bring you to the Supervisor Menu. Here you will be able to create additional
		interviewers, assign interviewers to EAs, view a report, synchronize with interviewers
		and headquarters (deployment to Dropbox required to sync with headquarters), change
		assignments, and log out.

	Log in as Interviewer:
	- At the Login menu select INTVW01 and enter pin 1234
	- At the Assignment Selection menu there will be one assignment
	- Select assignment "Interviewer: Matanga (11) / Kariba (09) / EA037"
	- This will bring you to the Interviewer Menu. Here you will be able to add a new household,
		view households that are in progress (three have already been enumerated), synchronize with
		supervisor, change assignments, and log out.


Understanding the Popstan Dictionaries

	Geocodes:
	The id items in the geocodes dictionary are comprised of the province, district, and
	enumeration area. Together they define a unique geographical area. Additionally, there are two
	fields, area level and area name. The area level is the depth of the geographical area in the
	geographical hierarchy (province 1, district 2, and enumeration area 3). The area name is the
	given name for the geographical area.

	As an example, let us break down the following geocode, 11090373EA 37:
	- Province: 11
	- District: 09
	- Enumeration Area: 037
	- Area Level: 3
	- Area Name: "EA 37"

	Staff:
	The id item in the staff dictionary is simply the staff code which is a universally unique
	identifier (UUID). The chance of creating a duplicate UUID is so small that it is considered
	unique. With the creation of each staff member the UUID is generated, then associated with
	staff details. The details include the username, role (supervisor/interviewer), supervisor's
	staff code (blank if supervisor), pin code, etc.

	Assignments:
	The id items in the assignments dictionary is comprised of the province, district, enumeration
	area, staff code, and role. Together they define a unique assignment. Typically, an enumeration
	area will have a single interviewer assigned to it. However, there are times when multiple
	interviewers will need to be assigned to a single enumeration area. The segment can then be
	used to distinguish between interviewers when they are interviewing in the same enumeration
	area. By the default the first assigned interviewer will be assigned segment A. The next B, and
	so on to Z.

	Household:
	The id items in the geocodes dictionary are comprised of the province, district, enumeration
	area, segment, and household number. Together they define a unique household. The household
	dictionary was designed to be minimal. Besides the id items it consists of three records. The
	population record defines data on the household members. Since there can be multiple members in
	a household it repeats. Notice that the population record is displayed on two forms. The
	interviewer will first collect basic information on all household members and then collect
	detailed information about each household member. The dwelling unit record is singly occurring
	and defines data about the dwelling unit. Finally, the metadata record is singly occurring
	record that contains data about the survey. For example, who conducted the interview and when.


Deploying to Dropbox

	To synchronize between the supervisor and headquarters the Popstan Census project will need to
	be deployed remotely to Dropbox. This will require a single Dropbox account that will be shared
	by all supervisors and interviewers.

	Deploy Locally:
	- Double-click DeployPopstanCensus.pff
	- The folder DeployPSC/ will be created with 3 subfolders (Data/, Household/, and Menu/)
	- Delete Data/

	Upload Applications:
	- Log in to Dropbox
	- Drag and drop DeployPSC/ into Dropbox's root

	Upload Geocodes Data:
	- Upload geocodes dictionary. To do this run the menu application on Windows or Android and
		select "Update programs from headquarters." This initiates a synchronization between your
		device and Dropbox which will upload the dictionary.
	- Upload geocode data. Double-click DeployPSC/Data/Gecodes.csdb to open the data file in the
		Data Viewer tool. To synchronize select File > Synchronize... > Dropbox > "upload
		changes to server (PUT)."
