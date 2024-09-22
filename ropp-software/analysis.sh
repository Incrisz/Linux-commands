mkdir analysis
cd analysis
wget https://data.cosmic.ucar.edu/gnss-ro/cosmic2/nrt/level1b/2022/001/conPhs_nrt_2022_001.tar.gz

tar -xzf conPhs_nrt_2022_001.tar.gz 

ucar2ropp conPhs_C2E2.2022.001.22.54.G24_0001.0001_nc -o new_output_file.nc

ucar2ropp
ropp_pp_occ_tool
ropp_1dvar_refrac