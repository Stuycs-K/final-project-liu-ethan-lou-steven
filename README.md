[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/syDSSnTt)
# APCS2 Final Project
THIS DOCUMENT IS REQUIRED
## Group Info
Period 3

Ethan Liu, Steven Lou

Group Name: Dashing Dawgs
## Overview
This is a simplified version of geometry dash involving a moving screen from left to right with obstacles in the way such as spikes and walls. There are a total of 5 different kinds of objects in the game: blocks, spikes, jump pads, orbs, and portals. There are two game modes currently: cube mode and wave mode. You can select between different levels and play them and you can also edit the levels.

## Instructions
Click the button on the top left to toggle between play mode and edit mode. 

#### Edit Mode:
* There are 5 different buttons at the top of the screen when you enter edit mode.
* Click on a button to choose which type of obstacle you want to place down and click on an empty space to place it there.
* If you click on an existing obstacle, press 'D' to delete it.
* If you click and drag on an existing obstacle, you can change it's size.
* You can scroll with your mouse wheel to navigate the level in edit mode.
* If you click on an existing block or spike and press 'C', you can change it's appearance.

#### Play Mode:
* Press 'W' to become invincible (for testing purposes)
* Press 'SPACE BAR' to jump
* Press 'S' to toggle between wave mode and cube mode (for testing purposes)
* Press the three bars at the bottom left to go into the home screen where you can select which level you want to play

## Presentation
https://drive.google.com/file/d/1lW6o90ncJPXD_zSxgMARVqluDw8eC3uk/view?usp=sharing

## Updated Prototype
https://docs.google.com/document/d/1j_-BwRy0CpeCh20EvbkXJRyj_qqJ-jBo64XUUDQEPzA/edit?usp=sharing

## Major Bugs
* If you are selecting a different type of obstacle than the one you are trying to delete, it won't delete it in the file. For example, if you have selected Block in edit mode and you click on a spike and press 'D', the spike will disappear but when you die and respawn, it will reappear.
* Due to file issues, you can not have more than ~250 obstacles in one map or else the program will crash.
* Shrink/enlarge doesn't work on some computers.