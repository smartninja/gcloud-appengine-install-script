# Installation script for gCloud and AppEngine

Instructions:

- Download the install.sh file and put it in your computer's main folder (don't put it on Desktop or in Downloads).
- Run the install file via the terminal using this command: `sh install.sh`.
- Wait for the script to finish.
- After the script completes, restart the terminal and test if the shortcuts work: `gcloud --help`

## Author
SmartNinja instructor Patrick Fodor, with a bit of help by Matej Ramuta.

## Manual steps

Manual steps that resemble what this script is doing automatically. Only use if script has an error.

Go to this website: [https://cloud.google.com/appengine/downloads](https://cloud.google.com/appengine/downloads), find Python (2.7) within the **Standard environment** (important!!!) and click on it.

<img class="img-responsive" src="https://storage.googleapis.com/smartninja/gae-standard-flexible-1525607962.png" width="500px">

Then skip the Step 1 because you already have Python installed and click on the button under Step 2: **Install and initialize Google Cloud SDK**.

<img class="img-responsive" src="https://storage.googleapis.com/smartninja-org-assets/curriculums/wd1/img/download-gcloud.png" width="500px">

Continue with the following steps:
 
1. unzip the file you downloaded
2. move the unzipped folder (called `google-cloud-sdk`) into your home folder (don't keep it in Downloads or on Desktop) 
3. and then run **install.sh** which exists in that folder.

The `install.sh` file can be run only via the terminal. Open the Terminal and navigate to the `google-cloud-sdk` folder.

How to navigate? First use this command in the terminal:

	ls

This command shows you all the folders and files within the folder you are currently in.

If you want to get into a new folder, use this:

	cd folder_name

If you want to get back to the previous folder, use this:

	cd ..

This should help you navigate to the `google-cloud-sdk` folder. When you're in it, run this:

	install.sh

If it doesn't work, you can try this:

	sh install.sh

<img class="img-responsive" src="https://storage.googleapis.com/smartninja-org-assets/curriculums/wd1/img/gcloud-init.png" width=500px>

Questions that show up in the terminal, are the following:

- **Do you want to help improve the Google Cloud SDK (Y/n)?**: It's optional, but you can choose Y.
- **Modify profile to update your $PATH and enable shell command completion? Do you want to continue (Y/n)?**: Here it's important that you enter Y! This way you get a `gcloud` shortcut in your terminal. (IMPORTANT: Linux might not ask you this question. This means you have to put gcloud in the path manually. Google how to do it.)
- **Enter a path to an rc file to update, or leave blank to use...**: Leave this empty and click Enter.
- If you get a question about enabling "compute.googleapis.com" (Compute Engine APIs) select No.

Gcloud is now installed. The following command helps you test if everything is set up correctly:

	gcloud --help

_(You might have to close the terminal first with a red X button so that the terminal path for gcloud updates)_

Also, run the above command **outside** the `google-cloud-sdk` folder, because you want to **make sure** this shortcut **works anywhere**. 

In case it doesn't, you'll have to **manually add path** to gcloud to the appropriate file (depends on the system). You can find instructions for this on Google Search.

> Example on Mac/Linux (if gcloud doesn't work): 
> 
> - open `.bashrc` in the terminal using vim: `vim .bashrc`.
> - press `i` on your keyboard so you can add new text to the file.
> - add the following line to the bottom of the .bashrc file: `export PATH=$PATH:$HOME/google-cloud-sdk/bin` (depends on where your google-cloud-sdk folder is). 
> - press ESC on your keyboard and then enter `:wq` in the terminal. This command saves your changes in the `.bashrc` file.
> - Then enter `source .bashrc` in the Terminal and try `gcloud --help`.

#### Gcloud App Engine component (Windows, Mac & Linux)

Cloud SDK is used for different Google's hosting solutions (Container Engine, Compute Engine, App Engine). As you know, we will use App Engine, so we need to install some additional tools. Type the following command in your terminal:

	gcloud components update
	gcloud components install app-engine-python
	gcloud components install app-engine-python-extras

Now we're ready to use GAE!
