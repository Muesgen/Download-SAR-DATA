Download-SAR-DATA
------
Marvin Müsgen

Last update: May 2021

This repository includes a feature that allows easy search and download of Sentinel-1 data (or other SAR data) hosted at the Alaska Satellite Facility (ASF) using the ASF API. Help on this API can be found at https://asf.alaska.edu/api/.

The function collects the necessary information (API keywords and values) and automatically writes them to a configuration text file. This configuration text is then passed to the script written by Eric Lindesey (https://github.com/ericlindsey/sentinel_query_download). The script generates an API query and downloads the resulting .csv file with the results.

Afterwards, all ordered images are unpacked and stored in a directory with the name of the time of execution. 

A shiny application for the application and the subsequent preprocessing is planned, which makes it possible for inexperienced users to download and preprocess Senitnel data automatically with a click.


