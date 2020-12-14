# set base image (host OS)
FROM ubuntu:18.04

# format changes required for asammdf v3.4.0
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# install system requirements
RUN apt-get update && apt-get install -y \
  unzip \
  wget

# install chrome driver
RUN wget https://chromedriver.storage.googleapis.com/88.0.4324.27/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN mv chromedriver /usr/bin/chromedriver
RUN chown root:root /usr/bin/chromedriver
RUN chmod +x /usr/bin/chromedriver


# install google chrome
RUN apt-get install -y libxss1 libappindicator1 libindicator7
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y ./google-chrome*.deb

# install python
RUN apt-get update && apt-get install -y \
  python3.6 \
  python3-pip \
  python3-setuptools

# set the working directory in the container
WORKDIR /kairos

# copy the dependencies file to the working directory
COPY src .

# just a fix
RUN python3 -m pip install google-api-python-client

# install the python requirements
RUN python3 setup.py install
