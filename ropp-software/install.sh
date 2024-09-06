#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install gfortran -y
sudo apt-get install build-essential -y
sudo apt-get install libxml2-dev -y
sudo apt-get install m4 
sudo apt-get install curl -y
sudo apt-get install libcurl4-openssl-dev
sudo apt-get install zlib1g-dev -y
sudo apt-get install libhdf5-dev -y
sudo apt-get install unzip -y



# Define main file and dependencies URLs
MAIN_FILE='https://drive.autofixersolution.com/index.php/s/XHcoxENprff92sj/download/ropp-11.3.tar.gz'

DEPS=('https://drive.autofixersolution.com/index.php/s/6JYSmqqZ8j4xyYP/download/eccodes-2.22.0-Source.tar.gz' 'https://drive.autofixersolution.com/index.php/s/K99n9B7SKCPmMKM/download/hdf5-1.10.6.tar.gz' 'https://github.com/Unidata/netcdf-c/archive/refs/tags/v4.9.2.tar.gz' 'https://drive.autofixersolution.com/index.php/s/Zt98ZjwCMbgAJxn/download/netcdf-fortran-4.5.2.tar.gz' 'https://drive.autofixersolution.com/index.php/s/42ZRNMbXSAJCebB/download/sofa_f-20190722.tar.gz' 'https://drive.autofixersolution.com/index.php/s/EayPJ3mczHCnEH9/download/zlib-1.2.11.tar.gz')

# Download main file
wget $MAIN_FILE

# Extract main file
tar xvzf $(basename $MAIN_FILE)

# Change directory into the extracted main file
cd ropp

# Download and extract dependencies into the main folder
for dep in ${DEPS[@]}; do
    wget $dep
    tar xvzf $(basename $dep)
done


sudo mkdir ropp_deps 
sudo mv sofa/ sofa_f-20190722/
sudo cp -r sofa_f-20190722/ ropp_deps/
sudo cp -r sofa_f-20190722/20190722/f77/ sofa_f-20190722/
sudo ./build_deps gfortran zlib hdf5 netcf netcdff eccodes sofa



cd netcdf-c-4.9.2
./configure --disable-hdf5 
make
make check
sudo make install

echo "netcdf-c-4.9.2 installation done"


# Go back to the original directory
cd ..

sudo ./build_deps gfortran netcdf eccodes sofa

