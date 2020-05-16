#!/bin/bash
set +eux

mkdir /home/openttd/.openttd/newgrf
cd /home/openttd/.openttd/newgrf || exit

wget http://bananas.cdn.openttd.org/newgrf/544d0101/a03b93117c7b363f21c436781e4df5b4/544d0101-2cc_TrainsInNML-3.0.tar.gz
wget http://bananas.cdn.openttd.org/newgrf/43485053/bd7d7783bdfca29cf1149cf9271fd8bb/43485053-CHIPS_Station_Set-1.9.0.tar.gz
wget http://bananas.cdn.openttd.org/newgrf/50430901/c3ae624a4f431b28fcb52cdb7f7867fa/50430901-CHIPS_Custom_Docks-1.0.tar.gz
wget http://bananas.cdn.openttd.org/newgrf/f1250007/997b31233dcfc059d343eb90e046d7eb/f1250007-FIRS_Industry_Replacement_Set_3-3.0.12.tar.gz
wget http://bananas.cdn.openttd.org/newgrf/414e0201/0da3a80b986bc3c17c20ca4ce9ca26aa/414e0201-FISH_2-2.0.3.tar.gz
wget http://bananas.cdn.openttd.org/newgrf/41501202/b13dd8fb0d7c34cacac2fe68bd137bb9/41501202-HEQS_Heavy_Equipment_Set-1.5.2.tar.gz
wget http://bananas.cdn.openttd.org/newgrf/4a430002/93eac5f5396584b92d4c5f0aaaf3f6c5/4a430002-Industrial_Stations_Renewal-1.0.2.tar.gz
wget http://bananas.cdn.openttd.org/newgrf/52453400/b2e27b74a3894198a00139cfcf09d011/52453400-Japanese_Buildings-3.1.tar.gz
wget http://bananas.cdn.openttd.org/newgrf/fbfb0402/d83cc84c8b92c924c5ebeee96565d194/fbfb0402-Metro_Track_Set-2.1.2.tar.gz
wget http://bananas.cdn.openttd.org/newgrf/9787eafe/04acd20a006e345283d6464678affa8b/9787eafe-Road_Hog-1.4.1.tar.gz

find -- *.gz -print0|xargs -0 -n1 tar -xzf
rm -- *.gz
