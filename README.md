## room5-automation
==========

## About
An automation framework designed in a way to handle multiple platforms from Web, Android and iOS.
Behavior-Driven Development(BDD) scenarios are added using cucumber which is an easy way to read and understand domain of the application.

## How to run:

- rake NAKAL_MODE=compare execute:web[@web]
1. This will execute all the test cases marked with tag @web
2. This will compare UI of the application using expected results under /baseline_images directory


- rake NAKAL_MODE=build execute:web[@web]
1. This will execute all the test cases marked with tag @web
2. This will build expected screens for UI verification application under /baseline_images directory

