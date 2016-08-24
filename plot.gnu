set terminal pdfcairo font "Sans,7" linewidth 2 rounded fontscale 0.3
set output "plot.pdf"

set multiplot layout 5, 4

set palette model RGB maxcolors 2
set palette defined ( 0 "black", 1 "white" )
	 
set view map 
set style data pm3d

set ylabel "Abs mag"
set xlabel "v (km/s)"
set cbrange[0:1]
set yrange[-8:5]
set xrange[1:500]
set logscale x

set cbtics 0,1

set key tc "red" font "Sans, 16" 

set title "0.1 kpc"
splot "results_0.1kpc.dat" u 3:2:4 t ""
set title "0.2 kpc"
splot "results_0.2kpc.dat" u 3:2:4 t ""
set title "0.3 kpc"
splot "results_0.3kpc.dat" u 3:2:4 t ""
set title "0.4 kpc"
splot "results_0.4kpc.dat" u 3:2:4 t ""
set title "0.5 kpc"
splot "results_0.5kpc.dat" u 3:2:4 t ""
set title "0.6 kpc"
splot "results_0.6kpc.dat" u 3:2:4 t ""
set title "0.7 kpc"
splot "results_0.7kpc.dat" u 3:2:4 t ""
set title "0.8 kpc"
splot "results_0.8kpc.dat" u 3:2:4 t ""
set title "0.9 kpc"
splot "results_0.9kpc.dat" u 3:2:4 t ""
set title "1.0 kpc"
splot "results_1.0kpc.dat" u 3:2:4 t ""
set title "1.1 kpc"
splot "results_1.1kpc.dat" u 3:2:4 t ""
set title "1.2 kpc"
splot "results_1.2kpc.dat" u 3:2:4 t ""
set title "1.3 kpc"
splot "results_1.3kpc.dat" u 3:2:4 t ""
set title "1.4 kpc"
splot "results_1.4kpc.dat" u 3:2:4 t ""
set title "1.5 kpc"
splot "results_1.5kpc.dat" u 3:2:4 t ""
set title "1.6 kpc"
splot "results_1.6kpc.dat" u 3:2:4 t ""
set title "1.7 kpc"
splot "results_1.7kpc.dat" u 3:2:4 t ""
set title "1.8 kpc"
splot "results_1.8kpc.dat" u 3:2:4 t ""
set title "1.9 kpc"
splot "results_1.9kpc.dat" u 3:2:4 t ""
set title "2.0 kpc"
splot "results_2.0kpc.dat" u 3:2:4 t ""
           
unset multiplot
set output
