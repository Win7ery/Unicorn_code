# Provenance JSON Parser
`ProvParser` parses CDM (E3) JSON provenance data into edge-list format.
Please use CamFlow parser to parse CamFlow data, instead of `ProvParser`, as the former is constantly updated as CamFlow evolves.

`ProvParser` parses all segmented datasets (suffixed `.<NUMBER>` in file names) together so that (hopefully) no unmatched subject/object `UUID`s (many unmatches still exist, unfortunately; those cases are logged in `error.log`). `ProvParser` employs a key-value database (i.e., `RocksDB`) due to memory constraint of parsing large files (100+GB). 

`ProvParser` parses JSON in a streaming fashion using `ijson`.
It also employs a series of other existing `python` packages to improve performance, including standard `python` packages such as `multiprocessing`.

> :warning: `ProvParser` depends on older versions of some external `python` packages. `ProvParser` is no longer actively supported or updated.

## Prerequisite
All pure `python` dependencies have already been included in `setup.py` and therefore will automatically be installed in the working environment when `ProvParser` is installed.
We have yet encountered any backward compatibility issues so far.

However, the following packages are required to be pre-installed before running `ProvParser`:
- YAJL (Yet Another Json Library)
- RocksDB

**Optional**:
Installing `kCacheGrind` is optional. You should install it only if you want to profile and visualize the performance of `ProvParser`.

### Installation
The following commands should guide you to install all the required and optional (only on Linux) packages on different OS.

#### macOS
Note: HomeBrew is required to run the following commands.

```
brew install yajl
brew install rocksdb
```
> :warning: macOS installation instructions may be outdated.

#### Ubuntu Linux (Latest Update: Aug 23, 2020)
```
# Install YAJL
sudo apt-get install libyajl2
# Install RocksDB 5.14.3 backend
git clone https://github.com/facebook/rocksdb.git
cd rocksdb
git checkout v5.14.3
mkdir build && cd build
cmake ..
make
sudo make install INSTALL_PATH=/usr
# Install Ubuntu packages for Python RocksDB frontend
sudo apt-get install libsnappy-dev libbz2-dev liblz4-dev
# (Optional) Install kcachegrind
sudo apt-get install kcachegrind
```

## Installation
`ProvParser` is easy to install. The following commands also create a virtual environment so you can safely install `ProvParser` and its dependencies.
Note that `ProvParser` is **not** available on PyPI. Please download or `git clone` our source code first, before running the following commands.
Assume now you are about to `cd` into the top-level directory `ProvParser`.

```
cd ProvParser
virtualenv -p /usr/bin/python2.7 testenv
source testenv/bin/activate
# We have to downgrade pip to 18.1 to allow `--process-dependency-links` option
pip install pip==18.1
pip install -e . --process-dependency-links
```

## Run
`ProvParser` is a commandline tool, run:
```
provparser -h
```

## Issue
- [ ] FiveDirections data is very dirty. `ta1-fivedirections-e3-official` contains trailing comas and un-namespaced record types.
