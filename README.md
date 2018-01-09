# Rspec with PageObject using Watir Webdriver
# Continuous Integration qa-pollinate-ci Framework Setup


# BitBucket 
https://bitbucket.org/Cason-Pollinate/qa-pollinate-ci

# Windows Ruby Installation:
* Download the latest version of Ruby from https://rubyinstaller.org/downloads/
* Run the Ruby Installer
* Select your language and agree to the terms, then on the install settings screen, check the boxes next to both “Add Ruby executables to your PATH” and “Associate .rb and .rbw files with this Ruby installation”. (You can also install Tcl/Tk support if you’d like, but its optional.)
* Locate the newly installed Ruby Program Folder and double click to open the folder
* Create a folder called "DevKit"
* Download the latest version of Ruby DevKit from https://rubyinstaller.org/downloads/
* When the download is finished, double click the file and you will be asked where to extract the files. Click the “…” button, and extract to the newly created DevKit folder.
Open the Command Prompt and change your current directory to the DevKit folder. (ex. "cd /Ruby/DevKit")
* Enter the following commands into the command prompt: 
	- ruby dk.rb init     
	- ruby dk.rb install

# Install SourceTree:
* Click the button for downloading SourceTree from the SourceTree website.
* Double-click the downloaded file to open it.
* Install SourceTree as you would any other installation.
* Open SourceTree and add your Bitbucket Server account credentials and click Continue.
* Clone from Remote Repository
* Choose the "qa-pollinate-ci" repository from Pollinate's Bitbucket
* Select a clone destination on your local machine

# Install/Setup Sublime Text 3:
* Navigate to https://www.sublimetext.com/3 and download the latest version of Sublime Text 3
* Install Sublime text 3 on your local machine by double clicking the install file
* Once Sublime Text is installed, open the program
* Press ctrl+` to open Sublime Text's console then paste the following and hit the Return key: 

import urllib.request,os,hashlib; h = 'df21e130d211cfc94d9b0905775a7c0f' + '1e3d39e33b79698005270310898eea76'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)

* Press ctrl+shift+p to access the package control manager
* Begin to type "Install" in the package control popup window
* Select "Package Control: Install Package"
* Install the following packages by entering their name in the search field: BeautifyRuby, Google Search, Open URL, Pretty Ruby, Rspec
Note: You must perform steps 6 and 7 for each package as the window will close once a package is chosen for installation

# Install Required Ruby Gems:
* In the Command Prompt, navigate to the local clone of the qa-pollinate-ci Repository (ex. "cd c:/qa-pollinate-ci")
* Enter the following commands in the prompt:
	- gem install bundler
	- bundle install
(This will install all required gems and their dependencies defined in the Gemfile and Gemfile.lock file)


# Setup ChromeWebdriver / Geckodriver:
* Download the latest version of ChromeWebdriver and Geckodriver:
	- https://sites.google.com/a/chromium.org/chromedriver/downloads
	- https://github.com/mozilla/geckodriver/releases
* Extract both the webdrivers into a $PATH location on your local machine (eg. C:\Ruby23\bin)
Note: To check preexisting PATH folder directories, simply type "path" in the command prompt

# Open qa-pollinate-ci Repository:
* In Sublime Text, select File > Open Folder
* Browse and select the cloned repository folder location

# Run Rspec Tests via Command Line / Terminal:
* Open Command Line (Windows) or Terminal (Mac) on your local machine
* Change directory to local qa-pollinate-ci repository (ex. "cd c:/qa-pollinate-ci)
* Enter the following command schema: "bundle exec rake <'site'>[<'environment'>,<'browser'>]            (ex. "bundle exec rake gk[staging,chrome]")

# Run Rspec Tests via Jenkins
* Open your browser window of choice
* Navigate to: jenkins.pollinate.com (Note: Must be connected to the office intranet)
* Each project will have a coresponding view per environment visible on the main page.
* To run a Test specification:
	- Click on the Project/Environment folder desired
	- Click the  button and the Job (test) will begin automating (Note: When a job is running you will be able to see a progress bar in the bottom left corner of the page and the circular icon next to the job name will blink)
	- If a Job fails, it will be displayed with a  icon
	- To view the console log for a previously ran job, navigate to http://jenkins.polliante.com/view/all/builds or click the "Build History" link.

# Documentation
- http://www.rubydoc.info/github/cheezy/page-object/PageObject
- https://github.com/cheezy/page-object/wiki/Elements
- http://www.rubydoc.info/gems/watir/Watir
- http://www.rubydoc.info/gems/rspec-core/RSpec


If you have any questions or requests, feel free to contact Cason Williams.

