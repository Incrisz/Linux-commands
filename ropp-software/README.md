# main file 
https://rom-saf.eumetsat.int/ropp/files/ropp-11.3.tar.gz


# dependecies that should be in the main file (extracted into the main file)
https://rom-saf.eumetsat.int/ropp/files/zlib-1.2.11.tar.gz
https://rom-saf.eumetsat.int/ropp/files/hdf5-1.10.6.tar.gz
https://github.com/Unidata/netcdf-c/archive/refs/tags/v4.9.2.tar.gz
https://rom-saf.eumetsat.int/ropp/files/netcdf-fortran-4.5.2.tar.gz
https://rom-saf.eumetsat.int/ropp/files/sofa_f-20190722.tar.gz
https://rom-saf.eumetsat.int/ropp/files/eccodes-2.22.0-Source.tar.gz




# main file 
https://drive.autofixersolution.com/index.php/s/XHcoxENprff92sj/download/ropp-11.3.tar.gz


# dependecies that should be in the main file (extracted into the main file)
https://drive.autofixersolution.com/index.php/s/6JYSmqqZ8j4xyYP/download/eccodes-2.22.0-Source.tar.gz
https://drive.autofixersolution.com/index.php/s/K99n9B7SKCPmMKM/download/hdf5-1.10.6.tar.gz
https://drive.autofixersolution.com/index.php/s/Zt98ZjwCMbgAJxn/download/netcdf-fortran-4.5.2.tar.gz
https://drive.autofixersolution.com/index.php/s/42ZRNMbXSAJCebB/download/sofa_f-20190722.tar.gz
https://drive.autofixersolution.com/index.php/s/EayPJ3mczHCnEH9/download/zlib-1.2.11.tar.gz

# netcdf-c-4.9.2 
https://github.com/Unidata/netcdf-c/archive/refs/tags/v4.9.2.tar.gz







# new installation cmds
export Ropp_ROOT=$HOME

# cp eccodes-2.22.0-Source , hdf5-1.10.6 , netcdf-c-4.7.3 , netcdf-fortran-4.5.2 , sofa_f-20190722 , zlib-1.2.11  to ropp folder
mkdir ropp_deps 
cp -r sofa/ ropp_deps/
sudo ./build_deps gfortran zlib hdf5 netcf netcdff eccodes sofa


cd netcdf-c-4.9.2
./configure
make
make check
sudo make install



./configure --disable-libxml2 --disable-hdf5
make
make check
sudo make install



sudo ./build_deps gfortran netcdff eccodes sofa

sudo ./build_ropp gfortran# ropp-software
