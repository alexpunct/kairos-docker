#!/bin/bash

git submodule update
docker build -t alexpunct/kairos .
