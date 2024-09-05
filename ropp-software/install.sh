#!/bin/bash

# Define main file and dependencies URLs
MAIN_FILE='https://rom-saf.eumetsat.int/ropp/files/ropp-11.3.tar.gz'
DEPS=('https://rom-saf.eumetsat.int/ropp/files/zlib-1.2.11.tar.gz' 'https://rom-saf.eumetsat.int/ropp/files/hdf5-1.10.6.tar.gz' 'https://github.com/Unidata/netcdf-c/archive/refs/tags/v4.9.2.tar.gz' 'https://rom-saf.eumetsat.int/ropp/files/netcdf-fortran-4.5.2.tar.gz' 'https://rom-saf.eumetsat.int/ropp/files/sofa_f-20190722.tar.gz' 'https://rom-saf.eumetsat.int/ropp/files/eccodes-2.22.0-Source.tar.gz')

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

# Go back to the original directory
cd ..
