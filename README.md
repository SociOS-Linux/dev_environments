
This repository contains environment setup scripts -- these primarily focus on
the Agent project, but in the future we'll standardize other projects on these.

# cloud cluster Cluster Python Environment (Agent)

## Setup
To setup the `prophet` environment (TensorFlow 1.7, Python 3.6):
```bash
make prophet
```
This installs everything you need, up to and including `conda` and the `db2_cli`.

To activate the environment, source the following script:
```bash
source /path/to/setup/activate_prophet.sh
```
You may want to alias the previous command or add it to your `.bashrc`.

## Removal
To remove the `prophet` environment:
```bash
make clean_prophet
```

To remove *all* environments, `conda`, and the `db2_cli` (at your own risk!):
```bash
make cleanest_prophet
```
Note you will have to disconnect and reconnect to complete the `conda` uninstall.

# Mac Python Environment (Agent)

## Setup
To setup the `prophet_mac` environment (TensorFlow 1.7, Python 3.6):
```bash
make prophet_mac
```

To activate the environment, use:
```bash
source activate prophet_mac
```

## Removal
To remove the `prophet_mac` environment:
```bash
make clean_prophet_mac
```
