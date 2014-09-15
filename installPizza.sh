#!/bin/bash

# This script is created by Domicor (eveplayerrare@126.com) to automate the
# installation of Pizza.py and its dependencies.
# Last updated Sep. 15, 2014.

# Copyright (C) <2014>  <Domicor>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


#############################################################
################ Introduction ###############################
#############################################################

# This script is for installing Pizza.py and its dependencies.

# This script is a direct learning result of Linux Shell Scripting Tutorial
# v1.05r3 - A Beginner's handbook(http://www.freeos.com/guides/lsst/)

# This script will install the minimum packages required for Pizza.py
# to run properly (at least to run the test file test_animate.py, which
# will be mentioned later).

# If this script doesn't work for you, please feel free to refer to 
# PizzaPyManual.pdf which is available at http://pizza.sandia.gov/doc/Manual.html
# However, if you combine this script with the manual, you shall see
# the installation process becomes a little easier.

# Most of the commands are derived from the aforementioned PizzaPyManual.pdf.

# You may wonder why I create this script given that we already have the
# manual. This is due to the complexity caused by the manual, which introduces
# every package related with the commands to install and test them and the 
# descriptions of their functionalities whether necessary or not. Also it's not
# very easy to tell the minimum requirements (i.e. the extra packages you need
# to install, such as Numpy), which is very overwhelming.

# Due to my lack of Linux shell programming, I apology for any malfunctioning
# of my script and the inconvenience it may cause to you. Any improvement
# or advice concerning the code or the code style is appreciated.


# This script only assures you that test_animate will run properly on 
# Ubuntu 14.04 LTS.
# No guarantee that this will fulfuill its work under other environment.

# Known issue:
# After running this script you will get a short animation but
# there will be info:
#No handlers could be found for logger "OpenGL.Tk"
#gl tool did not load:
#  can't find package Togl


# I'm sorry for this but currently I have no solution.



#############################################################
################ Pre-installation check #####################
#############################################################

# check if a customized directory is given to install Pizza.py.
if [ $# -eq 0 ]
then
echo "Usage - $0   directory"
echo "$0 : You must give/supply the directory"
read workingDir
echo "The current working directory is $workingDir"
else
workingDir=$1;
# e.g.: workingDir=/home/domicor/Documents/code
fi

# TODO: extract files from these tar.gz
# I desperately want to automate the extracting process but I don't know
# how to get all the file names and push the to the tar -xzvf.
# I'll leave it here for now.
# Following are some of my test record.

# Don't worry, you can unzip these files and carry out the main body.

#cd $workingDir

#cd /home/domicor/Documents/code/test
#tar -xzvf numpy-1.8.1.tar.gz

#ls *.tar.gz|packageName #failed

#ls *.tar.gz|tar -xzvf #failed

#############################################################
############################ Main body ######################
#############################################################

# Install numpy #############################################################
cd $workingDir/numpy-1.8.1
sudo apt-get install python-dev
sudo python setup.py install

# Install pmw #############################################################
cd $workingDir/Pmw-2.0.0
sudo python setup.py install

# Install PyOpenGL #############################################################
cd $workingDir/PyOpenGL-3.1.0
sudo python setup.py install
# test with: import OpenGL
# see if PyOpenGL supports Togl: 
# from OpenGL.Tk import *
# from OpenGL.GLUT import *

# Install tcl #############################################################
cd $workingDir/tcl8.6.2/unix
./configure
make
if [ $? -eq 0 ]
then
echo 'make successfully.'
else
echo 'tcl make failed.'
exit 1
fi
sudo make install #The tclsh is created right here in the current folder.

# Install tk #############################################################
cd $workingDir
cd ./tk8.6.2/unix
# you can use apt-cache search X11-dev to search for following packages.
sudo apt-get install libx11-dev # for X11
sudo apt-get install libxkbcommon-x11-dev # for X11
# sudo apt-get install libghc-x11-dev # for X11 . This package is very huge.
./configure
if make
then
echo 'make succeeded.'
else
echo 'tk make failed.'
exit 1
fi
sudo make install #The wish is created right here in the current folder.

# Install togl #############################################################

# It's written that we can use tclsh and type:
# puts $tcl_libPath
# to find out where our tcl libs are. However this failed for me.
# And I trace back to the Makefile as instructed as follows:

# From installation instructions of Togl:
#(f) Type "make install" to install Tcl binaries and script files in standard
#    places. You'll need write permission on the installation directories to do
#    this. The installation directories are determined by the "configure"
#    script and may be specified with the standard --prefix and --exec-prefix
#    options to "configure". See the Makefile for information on what
#    directories were chosen; you can override these choices by modifying the
#    "prefix" and "exec_prefix" variables in the Makefile. The installed
#    binaries have embedded within them path values relative to the install
#    directory. If you change your mind about where Tcl should be installed,
#    start this procedure over again from step (a) so that the path embedded in
#    the binaries agrees with the install location.

# I found this directory
# libdir			= /usr/local/lib
sudo cp -r $workingDir/Togl2.0-8.4-Linux/lib/Togl2.0 /usr/local/lib
#if not do above you can import Tkinter but not ImageTk.

sudo apt-get install python-tk
# test with: import Tkinter


# Install PIL (Imaging-1.1.7)
#############################################################
cd $workingDir/Imaging-1.1.7
sudo python setup.py install
# after the above steps and you can have "import ImageTk" work.

# To have GUIs, you should have Tkinter.
# Test with:
# import Tkinter
# Tkinter_test()
# and you will see a window popping up.



#############################################################
#################### Launch and Test ########################
#############################################################
# to launch pizza.py, type:
# python -i $workingDir/pizza-2Jul14/src/pizza.py
# if you wish to run commands under pizza.py, type commands like:
# @run test_bdump.py

# use the following command to see if the installation is successful.
# Ctrl+D to abort.
cd $workingDir/pizza-2Jul14/examples
python -i $workingDir/pizza-2Jul14/src/pizza.py -f test_animate.py


