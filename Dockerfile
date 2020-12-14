# set base image (host OS)
FROM python:3.6

# set the working directory in the container
WORKDIR /kairos

# copy the dependencies file to the working directory
COPY src .
