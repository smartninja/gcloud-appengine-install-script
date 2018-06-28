# Installation script for gCloud and AppEngine (standard environment, Python)
# Author: Patrick Fodor (PatrickVienne), with a bit of help by Matej Ramuta

# check OS to get correct download link
if [ "$(uname)" == "Darwin" ]; then
link="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-200.0.0-darwin-x86_64.tar.gz";
else echo "Not Mac";fi
if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then link="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-200.0.0-linux-x86_64.tar.gz"; else echo "Not Linux"; fi
echo ${link}

# Download gcloud sdk
if [ ! -d ~/google-cloud-sdk ]; then curl "$link" | tar xvz -C ~; else echo "google-cloud-sdk folder already downloaded in home directory"; fi
cd ~
bash ./google-cloud-sdk/install.sh --quiet

# export binaries directory to path
export GCLOUD_DIR=$(cd google-cloud-sdk/bin; pwd)

# check if directory is in the path
if [ :$PATH: == *:"$GCLOUD_DIR":* ] ; then
    echo '${GCLOUD_DIR}' already in path;
else
    echo Adding GCLOUD Binaries Path: '${GCLOUD_DIR}' to Path and .bash_profile file;
    export NEW_PATH=$PATH:$GCLOUD_DIR;
    export PATH=$PATH:$GCLOUD_DIR;
    bash google-cloud-sdk/path.bash.inc;
    echo Adding GCLOUD Completion;
    bash google-cloud-sdk/completion.bash.inc;
 
    export PATH=$PATH:$GCLOUD_DIR
    if [ -f ~/.bash_profile ]; then
        echo .bash_profile exists; 
    else
	echo Creating .bash_profile File; 
	touch .bash_profile;
    fi

    if grep -F "$GCLOUD_DIR" .bash_profile;  then
        echo already added to .bash_profile
    else
        echo adding to .bash_profile
        echo "export PATH=$NEW_PATH" >> .bash_profile;
    fi
    
    source .bash_profile;
fi

# install gcloud components
gcloud components update --quiet
gcloud components install app-engine-python   --quiet
gcloud components install app-engine-python-extras --quiet

echo ALL INSTALLATION FINISHED
echo =========================

echo PLEASE RESTART YOUR SHELL NOW!!
