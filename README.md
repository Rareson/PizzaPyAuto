PizzaPyAuto
===========

This script is for installing Pizza.py and its dependencies.

This is resulted from our teacher's requirements of Computational Materials Science. We need to 
finish a project to finish to get our grade in this course. I think the dependencies of Pizza.py is a little too
complicated and every time I need to reinstall it, I'm destined to re-implement all those tedious steps ever and 
ever again. So I decided to write a script to automate the tasks, which is always my dream, a.k.a. making computer
work for me completely automatically. Also by doing this, I can help my classmates who are not so proficient in
programming. 

Finishing this script (anyway, the draft is published) really deepen my understanding of Shell programming,
to be more specific, bash programming. Also, python and some tclsh syntax are absorbed. If needed, I will
try refining my script. I hope that finally I can make it good enough to get it back to the author of Pizza.py
and make my script part of the huge picture.

You can use this script by doing this:

(1)Unzip all the tar.gz. (you can do it by selecting all the files and right click and then click "Extract here").

(2)Check your file path and bring up you terminal and run: cd yourPath(e.g. cd /home/domicor/Desktop/Pizza)

(3) chmod 777 ./installPizza.sh

(4)./installPizza.sh yourPath (e.g. ./installPizza.sh /home/domicor/Desktop/Pizza)

(5)after step (4), you should see a window showing some simple animation. If it failed to do so, please refer to installPizza.sh.


Required packages are as follows:
Imaging-1.1.7.tar.gz  Pmw-2.0.0.tar.gz       tk8.6.2-src.tar.gz
numpy-1.8.1.tar.gz    PyOpenGL-3.1.0.tar.gz  Togl2.0-8.4-Linux64.tar.gz
pizza.tar.gz          tcl8.6.2-src.tar.gz

You can find the newest version of the script and the required packages in my github repository:
https://github.com/Rareson/PizzaPyAuto
Please feel free to fork or comment or email to me Domicor (eveplayerrare@126.com)

You can preview the result by browsing SampleScreenShot2014-09-15.png.
