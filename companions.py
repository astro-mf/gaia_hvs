# Code to calculate detectable hyper velocity stars in Gaia DR1 (TGAS)
# as a function of distance, velocity and abs. mag
# 
# Morgan Fraser
# Institute of Astronomy, Cambridge
# 23/08/16

import numpy as np

# This array contains Table 1 in
# http://adsabs.harvard.edu/abs/2015A%26A...574A.115M
# Subset Tycho without Hipparcos
# Colums are 
# 1. Lower limit to mag bin
# 2. Upper limit to mag bin
# 3. Parallax uncertainty in uas
# 4. PM uncertainty in uas / yr

tegas_err = [(6,  7,  399, 198),
             (7,  8,  348, 264),
             (8,  9,  327, 403),
             (9,  10, 407, 680),
             (10, 11, 601, 1145),
             (11, 12, 722, 1522),
             (12, 13, 702, 1615)]

# Boundaries of grid to calculate
# Distance in kpc
min_dist = 0.1
max_dist = 2
dist_steps = 20

# Abs mags
min_abs_mag = -8
max_abs_mag = 5
abs_mag_steps = 30

# Transverse velocities
min_vel = 1
max_vel = 500
dist_vel = 100

distance_array = np.linspace(min_dist, max_dist, dist_steps)
abs_mag_array =  np.linspace(min_abs_mag, max_abs_mag, abs_mag_steps)
vel_array = np.linspace(min_vel, max_vel, dist_vel)


faint_mag_limit =  13.0       # Stars fainter than this will be considered unobservable
bright_mag_limit = 6.0          # Stars brighter than this will be in Hipparcos
distance_err_tolerance = 0.5        # Maximum fractional uncertainty in parallax (i.e. 1 is 100% error, 0.1 is 10% error)
proper_motion_err_tolerance = 0.5   # Maximum fractional uncertainty in PM


# Loop over all possible combinations of distance, abs mag and velocity
for distance in distance_array:
    filepointer=open('results_'+str(distance)+'kpc.dat', 'w')       # Open file for output
    for abs_mag in abs_mag_array:
        for vel in vel_array:
            print "\n For ", distance, abs_mag, vel
            flag = 1                                                # Flag is 1 for stars that are observable, change to 0 if not
#            print distance, abs_mag, vel

# Check if star is bright enough to be in Tycho / TGAS
            distance_modulus = (5*np.log10(distance*1000))-5
            apparent_mag = abs_mag +  distance_modulus
            print "Ap. mag=", apparent_mag, "Abs. mag=", abs_mag, "DM", distance_modulus
            if apparent_mag>faint_mag_limit:
                flag = 0
                print "Apparent mag too faint"
            elif apparent_mag<bright_mag_limit:
                flag = 0
                print "Apparent mag too bright"
            else:
                print "Apparent mag OK"
                
# Check if star will have parallax with less than X percent uncertainty
                parallax = 1 / (distance * 1000)
                print "Parallax (arcsec) = ", parallax
                for i in tegas_err:
                    if i[0]< apparent_mag< i[1]:
                        print "Err on parallax (arcsec) =", i[2]/1e6
                        print "Fractional uncertainty in parallax", ((i[2]/1e6) / parallax)
                        if (i[2]/1e6) / parallax > distance_err_tolerance:
                            flag = 0
                            print "Uncertainty on parallax too high"
                        else:
                            print "Parallax OK"

# Now check if proper motion is detectable
                            proper_motion = (vel * distance) / 0.21
                            print "Proper motion (mas / yr) = ", proper_motion
                            for j in tegas_err:
                                if j[0]< apparent_mag< j[1]:
                                    print "Err on PM (mas / yr) =", i[2]/1e3
                                    print "Fractional uncertainty in PM", ((j[3]/1e3) / proper_motion)
                                    if ((j[3]/1e3) / proper_motion) > proper_motion_err_tolerance:
                                        print "Uncertainty on PM too high"
                                        flag = 0
                                    else:
                                        print "PM OK"
                                        
            
# Write output to file, depending on how flag is set
            if flag==1:
                print distance, abs_mag, vel, "1"
                filepointer.write('{} {} {} 1 \n'.format(distance, abs_mag, vel))

            if flag==0:
                print distance, abs_mag, vel, "0"
                filepointer.write('{} {} {} 0 \n'.format(distance, abs_mag, vel))
            
        filepointer.write('\n')
    filepointer.close()
