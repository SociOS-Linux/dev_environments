# Script to setup local env  This creates a conda environment called
# $ENV_NAME and installs a set of standard requirements.
#
# As of now the focus is on automating setup for an environment
if [ -z "$ENV_NAME" ]; then
    ENV_NAME=prophet
fi

# Install anaconda if it's not installed
command -v conda >> /dev/null
if [ $? != 0 ]; then
    wget -nc https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh
    bash Anaconda3-2021.11-Linux-x86_64.sh
    source ~/.bashrc  # required to finish conda setup
    rm Anaconda3-2021.11-Linux-x86_64.sh
else
    echo ✓ Conda installed
fi

# Create environment if not already created
conda info --envs | grep ${ENV_NAME} >> /dev/null
if [ $? != 0 ]; then
    yes | conda create -n ${ENV_NAME} python=3.6 pip scipy scikit-learn seaborn numpydoc odo datashape sqlalchemy tqdm greenlet
else
    echo ✓ Environment \"${ENV_NAME}\" exists
fi

source activate ${ENV_NAME}

python -c "import spacy; spacy.load('en')" | grep 'no model found'
if [ $? != 1 ]; then
    python -m spacy download en
fi

echo -e "✓ Setup completed"

source activate_prophet.sh
