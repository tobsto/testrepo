#!/bin/sh
#
# bash script to run setup
#

#
# Variables
#
# name for the environment
ENV_NAME=testrepo
# python version 
PYTHON=python=3.7
# miniconda
CONDA_DIR=~/programs/install/miniconda3
# scipopt
SCIPOPT_DIR=~/programs/install/scipoptsuite


function main {
    # 
    # main function
    #
    ENV_PATH=$CONDA_DIR/envs/$ENV_NAME
    source ./dev_tools/env/env_func.sh
    create_env $ENV_PATH $PYTHON
    set_env_vars $ENV_PATH $SCIPOPT_DIR
    install $ENV_PATH
}


# 
# call main function
#
main
