# Load the conda environment, modules, and set environment variables for prophet..
if [ -z "$ENV_NAME" ]; then
    ENV_NAME=prophet
fi

conda info --envs | grep ${ENV_NAME} >> /dev/null
if [ $? != 0 ]; then
    echo "✖ Environment ${ENV_NAME} does not exist"
else
    source activate ${ENV_NAME}
    module purge  # ensure user isn't using any other modules
fi
