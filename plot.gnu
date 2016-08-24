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

set key tc "red" font "Sans, 16" 

splot "results_0.1.dat" u 3:2:4 t "0.1"
splot "results_0.2.dat" u 3:2:4 t "0.2"
splot "results_0.3.dat" u 3:2:4 t "0.3"
splot "results_0.4.dat" u 3:2:4 t "0.4"
splot "results_0.5.dat" u 3:2:4 t "0.5"
splot "results_0.6.dat" u 3:2:4 t "0.6"
splot "results_0.7.dat" u 3:2:4 t "0.7"
splot "results_0.8.dat" u 3:2:4 t "0.8"
splot "results_0.9.dat" u 3:2:4 t "0.9"
splot "results_1.0.dat" u 3:2:4 t "1.0"
splot "results_1.1.dat" u 3:2:4 t "1.1"
splot "results_1.2.dat" u 3:2:4 t "1.2"
splot "results_1.3.dat" u 3:2:4 t "1.3"
splot "results_1.4.dat" u 3:2:4 t "1.4"
splot "results_1.5.dat" u 3:2:4 t "1.5"
splot "results_1.6.dat" u 3:2:4 t "1.6"
splot "results_1.7.dat" u 3:2:4 t "1.7"
splot "results_1.8.dat" u 3:2:4 t "1.8"
splot "results_1.9.dat" u 3:2:4 t "1.9"
splot "results_2.0.dat" u 3:2:4 t "2.0"

unset multiplot
set output
