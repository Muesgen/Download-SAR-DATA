Download-SAR-DATA
------
Marvin Müsgen

Last update: May 2021

This repository includes a feature that allows easy search and download of Sentinel-1 data (or other SAR data) hosted at the Alaska Satellite Facility (ASF) using the ASF API. Help on this API can be found at https://asf.alaska.edu/api/.

The function collects the necessary information (API keywords and values) and automatically writes them to a configuration text file. This configuration text is then passed to the script written by Eric Lindesey (https://github.com/ericlindsey/sentinel_query_download). The script generates an API query and downloads the resulting .csv file with the results.

Afterwards, all ordered images are unpacked and stored in a directory with the name of the time of execution. 

A shiny application for the application and the subsequent preprocessing is planned, which makes it possible for inexperienced users to download and preprocess Senitnel data automatically with a click.

Requirements:
----
Python3
Wget
R > 3.5
Account at ASF https://asf.alaska.edu/

Python3:
----
A Python 3 installation is required. You can test your Python version with the following command:

``python --version``

If your version is Python 2, check if you have another version with python 3 installed before installing python 3: 

```which - a python```

If you see more than one Python interpreter, test the versions of the other interpreters in the same way. 
If you do not have Python3 installed, install it from the command line as follows:

```brew install pyenv ```

```pyenv install 3.7.3```

```pyenv global 3.7.3```

```pyenv version```

```$ echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.zshrc```

Now your new Python3 Interpreter should be setted as default on your system. 

wget:
----
```brew install wget```
