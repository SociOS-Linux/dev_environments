# Script to setup local  This creates a conda environment called
# $ENV_NAME and installs a set of standard requirements.
#
# As of the focus is on automating setup for an environment
# on which an agent can be set up.
if [ -z "$ENV_NAME" ]; then
    ENV_NAME=prophet_mac
fi

# Install anaconda if it's not installed
command -v conda >> /dev/null
if [ $? != 0 ]; then
    echo Install Anaconda!
    exit 1
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

pip install --no-cache-dir Cython==0.28.4
yes | conda install -c anaconda msgpack-python
pip install --no-cache-dir msgpack
pip install --no-cache-dir tensorflow==1.7.0
pip install --no-cache-dir -r ../requirements/requirements_prophet.txt
pip install --no-cache-dir spacy==1.9.0
pip install --no-cache-dir grpcio-tools googleapis-common-protos

# Check for spacy-English model
python -c "import spacy; spacy.load('en')" >> /dev/null 2>/dev/null
if [ $? != 0 ]; then
    python -m spacy download en
fi

echo -e "✓ Setup completed"
