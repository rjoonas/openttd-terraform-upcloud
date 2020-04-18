#!/bin/bash
set +eux

mkdir /home/openttd/.openttd/newgrf
cd /home/openttd/.openttd/newgrf || exit

wget https://binaries.openttd.org/bananas/newgrf/2cc_TrainsInNML-3.0.tar.gz
wget https://binaries.openttd.org/bananas/newgrf/CHIPS_Station_Set-1.9.0.tar.gz
wget https://binaries.openttd.org/bananas/newgrf/CHIPS_Custom_Docks-1.0.tar.gz
wget https://binaries.openttd.org/bananas/newgrf/FIRS_Industry_Replacement_Set_3-3.0.12.tar.gz
wget https://binaries.openttd.org/bananas/newgrf/FISH_2-2.0.3.tar.gz
wget https://binaries.openttd.org/bananas/newgrf/HEQS_Heavy_Equipment_Set-1.5.2.tar.gz
wget https://binaries.openttd.org/bananas/newgrf/Industrial_Stations_Renewal-1.0.2.tar.gz
wget https://binaries.openttd.org/bananas/newgrf/Japanese_Buildings-3.1.tar.gz
wget https://binaries.openttd.org/bananas/newgrf/Metro_Track_Set-2.1.2.tar.gz
wget https://binaries.openttd.org/bananas/newgrf/Road_Hog-1.4.1.tar.gz

find -- *.gz -print0|xargs -0 -n1 tar -xzf
rm -- *.gz
