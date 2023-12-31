FROM gitpod/workspace-full
SHELL ["/bin/bash", "-c"]

RUN sudo apt-get -qq update
# Install required libraries for Projector + PhpStorm
RUN sudo apt-get -qq install -y python3 python3-pip libxext6 libxrender1 libxtst6 libfreetype6 libxi6
# Install Projector
RUN pip3 install projector-installer
# Install PhpStorm
RUN mkdir -p ~/.projector/configs  # Prevents projector install from asking for the license acceptance
# no projector needed now
#RUN projector install 'PhpStorm 2021.1' --no-auto-run

# Install ddev by currently documented brew repo `brew install ddev/ddev/ddev`
#	https://ddev.readthedocs.io/en/latest/users/install/ddev-installation/#macos 
RUN brew update && brew install ddev/ddev/ddev && mkcert -install

# install git-extras for git effort so to do `git effort --above 5 * -- --after="two year ago`
RUN sudo apt-get install git-extras

###
### Initiate a rebuild of Gitpod's image by updating this comment #1
###
