This is the model for the paper:

Pashut T, Wolfus S, Friedman A, Lavidor M, Bar-Gad I, et al. (2011)
Mechanisms of Magnetic Stimulation of Central Nervous System
Neurons. PLoS Comput Biol 7(3):e1002022

This model was contributed by Alon Korngreen.

Usage:

There are a one dimensional and a two dimensional model in directories
with those names.  Here are the directions for each:

One Dimensional:

* Open the file "demo.hoc"

* Press "Init & Run" in the RunControl window.

*         A movie presenting the membrane potential along the axon
*         fiber will appear in the Graph[3] window. Notice that the
*         stimulation amplitude default is set to 30 volts agreeing
*         with the subthreshold activity.  You can control the
*         electrical circuit and stimulation parameters in the
*         Magnetic Coil Current window. Changing the stimulation
*         amplitude to a value higher than 36 volt will present a
*         superthreshold activity.

* In addition to the movie graph, the pulse shape is presented in
          Graph window and the membrane potential in the soma as a
          function of time is presented in Graph[2].


Two dimensional:

* Open the folder "fieldCalc".

* Open the file "fieldGUI.m" with MATLAB program.

* type "fieldGUI" in the commend window and press enter.

* A window named "fieldGUI" will appear. Enter the coil parameters
          into the three text boxes:

o Coil radius in meters.

o Number of coiling (loops).

o Distance of the cell from the coil (Z) in meters.

* Press the "show graph" bottom and two graphs will appear below, the
          induced electric field in x direction (E_x ) on the left and
          the induced electric field in the y direction of the left
          (E_y ). This will take 60-90 minutes. The matrixes of the
          two graph will also be saved in the folder "fieldCalc" as
          text files.

* Copy the text files (ex.txt and ey.txt) into the folder named
          "Neuron".

* Open the file "BACModel_mag.hoc" located in the "Neuron" folder.

* The first figure that opens shows the soma membrane potential as a
          function of time. The second shows the pulse shape.

* To run the program press the "Init & Run" bottom in the "RunControl"
          panel.

* You can control the electrical circuit and stimulation parameters in
          the Magnetic Coil Current window. Changing the stimulation
          amplitude to a value higher than 1900 volt will present a
          superthreshold activity.

* To manufacture a shape plot:

o go to NEURON main menu

o click on graph - shape plot. A window showing the cell morphology
will appear.  o Right click in the window and chose the option shape
plot.

* The cell in the window will be colored according to the membrane
          potential in every location. A scale bar will also appear
          next to it, presenting the voltage matching the different
          colors. To start the movie press the "Init & Run" bottom in
          the "RunControl" panel.
