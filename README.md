# gaia_hvs

Python code to check if a given star will be in TGAS.

1. Check if apparent mag is within TGAS range (i.e. 6~<mag~<12)

2. Check if uncertainty in parallax is below allowed limit (given TGAS errors
from Michalik et al.)

3. Check if uncertainty in proper motion is below allowed limit.

Write result_N.Nkpc.dat file.

The results files are plotted using the gnuplot script plot.gnu 
