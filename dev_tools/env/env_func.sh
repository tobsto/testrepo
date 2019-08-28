#!/bin/sh
#
# bash scripts for virtual environment
#

function clean_env() {
    #
    # clean the environment
    #
    ENV_PATH=$1
    rm -rf $ENV_PATH
}

function create_env() {
    #
    # create the environment
    #
    ENV_PATH=$1
    PYTHON=$2
    source ~/.profile
    conda update --all -y
    conda create --prefix $ENV_PATH -y $PYTHON
    conda activate $ENV_PATH
    pip install --upgrade pip
}

function set_env_vars() {
    #
    # set the environment variables for SCIP
    #
    ENV_PATH=$1
    SCIPOPT_DIR=$2
    ENVVAR_DIR=$ENV_PATH/etc/conda
    mkdir -p $ENVVAR_DIR/activate.d
    mkdir -p $ENVVAR_DIR/deactivate.d
    touch $ENVVAR_DIR/activate.d/env_vars.sh
    touch $ENVVAR_DIR/deactivate.d/env_vars.sh
    echo "#!/bin/bash" >> $ENVVAR_DIR/activate.d/env_vars.sh
    echo "export SCIPOPTDIR=$SCIPOPT_DIR" >> $ENVVAR_DIR/activate.d/env_vars.sh
    echo "#!/bin/bash" >> $ENVVAR_DIR/deactivate.d/env_vars.sh
    echo "unset SCIPOPTDIR" >> $ENVVAR_DIR/deactivate.d/env_vars.sh
}

function install() {
    #
    # install packages in environment
    #
    ENV_PATH=$1
    source ~/.profile
    conda activate $ENV_PATH
    pip install -r ./requirements.txt -e ./
}

function uninstall() {
    #
    # uninstall packages in environment
    #
    ENV_PATH=$1
    PACKAGE=$2
    source ~/.profile
    conda activate $ENV_PATH
    pip uninstall -y $PACKAGE
}

function clean() {
    #
    # clean packages in environment
    #
    ENV_PATH=$1
    PACKAGE=$2
    source ~/.profile
    conda activate $ENV_PATH 
    pip uninstall -y $PACKAGE
    rm -rf ./$PACKAGE.egg-in
}