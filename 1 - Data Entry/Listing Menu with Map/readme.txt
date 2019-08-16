Example Listing Menu Application With Maps
==========================================

This is an example of using maps in a data entry menu application.
For a simpler example that displays households on a map without a
separate menu application see the Listing with Map example.

The application is used to collect the location and basic information
about structures (buildings). The structures that have been surveyed
are displayed on map. Tapping on the structure on the map allows you
to view and edit information about the structure.

This application also demonstrates how to have a user specify the
location of the structure by tapping on the map. This is an alternative
to using the GPS function.

There are two CSPro applications used in this survey:

* Listing: the application to collect information about a structure
* ListingMenu: a menu program that displays the structures on the map and
               launches the listing program when you tap on a structure

Requirements
------------

Since the mapping functionality only works on Android, this application
can only be run on Android devices.

The Android device must have Google Play Services installed. If the
Google Play Services on the device is an older version you may need to
upgrade to the latest version through the Google Play application.

This application uses online maps so a network connection is required.

Deploying the applications
--------------------------

To deploy the applications to a mobile device, run the deployment script
Deploy Listing with Map.csds. This will generate a folder named
DeployListingMenuWithMap containing all the required files. Simply copy
this folder to the CSEntry folder of the mobile device.

Icons
-----

Icons used in this application were generated using http://fa2png.io/ and
are from Fontawesome.
See https://github.com/FortAwesome/Font-Awesome/blob/master/LICENSE.txt for
licensing.
