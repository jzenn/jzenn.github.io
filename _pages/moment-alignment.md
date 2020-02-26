---
title: "Moment Alignment"
permalink: /projects/moment-alignment
---

**This site is under construction.**

This project implements an extension to the Adaptive Instance Normalization module 
from the approach that was proposed by Huang et al. in **(cite Huang et al.)**.
The moment alignment module is able to not only adapt the first two statistical 
moments of content feature maps and style feature maps but also to align up to 
five statistical moments.

In an autoencoder setting where the module is placed between encoder and decoder
it is able to produce reasonable style transfer results that get stronger the more 
moments are aligned.    

- The project is written in Python ```3.7``` and uses PyTorch ```1.1``` 
(also working with PyTorch ```1.3```).

- ````requirements.txt```` lists the python packages needed to run the 
project. 

### Network

The network architecture utilizes several convolutions that are applied with a
```1 x 1``` kernel to the content feature map. Additionally, the network gets the
first ```N``` statistical moments of both content feature maps and style feature 
maps as input.

### Loss
 
A novel moment loss measures the distance of the first ```N``` statistical moments
of a transfer feature maps to the first ```N``` statistical moments of a style 
feature map.

#### Moment Alignment
The idea of the project is to compare the Gram matrix loss with a so-called moment 
loss that measures the difference between the first ````N```` moments of noise
features and style features.  

A further explanation as well as analysis can be found in the pdf-file of this 
repository.

### Usage

The ``configurations``-folder specifies four configurations that can be used to 
train and test the model. The project only gets the exact path to the 
configuration that is used e.g. ```python main.py './configurations/train.yaml'```.

- ``train.yaml`` trains the moment alignment module from scratch.

- ```test.yaml``` tests the moment alignment module by producing transfer images from
content image, style image feature pairs.

- ```test_multiple.yaml``` produces several images from different moment alignment 
modules and displays the images next to each other.

- ```test_analytical_solution.yaml``` measures the error of the analytical solution 
for two moments and the learned solution.

### Additional Information

This project is part of a bachelor thesis which was submitted in August 2019. The 
moment alignment network makes up two chapter of the final thesis. A slightly modified 
version of the chapter can be found in this repository as a pdf-file. Also, the chapter 
introduces all related formulas to this work. 

The final thesis can be found **(link here)** in a corrected and modified version. 