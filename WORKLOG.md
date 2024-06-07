# Work Log

## Ethan Liu

### 5/22/24
* Wrote the Obstacle class.
* Wrote constructors for the Block class.
* Organized files.

### 5/23/24
* Wrote setup() and draw.
* Wrote display(Block).
* Successfully displayed scrolling screen with blocks.

### 5/25/24
* Wrote isTouching() for Block class.
* Started coding jump() with bugs.

### 5/26/24
* Fixed jumping in midair.
* Changed inScreen from ArrayList to ArrayDeque.
* Made Sprite fall from Blocks.
* Implemented death restart.
* Tried fixing jumping onto blocks issue.

### 5/27/24
* Fixed sprite falling out of the screen
* Made sprite falling from block more smooth.

### 5/28/24
* Wrote Button class.
* Worked on Edit mode. When the user clicks, new Blocks spawn there.

### 5/29/24
* Can now delete walls.
* Now when you click, you rotate between a block, block with jump pad, and a spike.
* Changed ArrayLists into Sets for quicker add and remove runtimes.

### 5/30/24
* Wrote Text class.
* Worked on saving the blocks and spikes into files so that the map stays when you run it again.

### 6/2/24
* Convert ArrayLists to TreeSets
* Wrote compareTo() functions for Block and Spike
* Worked on mouseWheel() functionality in edit mode.
* Stored Block and Spike coordinates in Strings.

## Steven Lou
### 5/22/24
* Wrote the Spike class methods and constructors.
* Tested with branches.

### 5/23/24
* Wrote Sprite class.
* Wrote display(Spike).
* Helped with window scrolling.

### 5/26/24
* jump() gravity physics fixed
* Created inScreen ArrayList for interactions with other blocks
* Tried to implement isTouching() with Sprite (has bugs)

### 5/28/24
* Spinning feature added to sprite display
* Incorporated spinning feature with touching blocks
* Fixed spike isTouching() to work with sprite

### 5/29/24
* Added jump pad feature to walls
* Fixed spike isTouching() bugs
* Fixed spinning display bugs

### 5/31/24
* Fixed display issues
* isTouching() and collisions altered
* keyPressed changed

### 6/2/24
* Fixed local file issues
* Created first ~25 seconds of Stereo Madness for demo

### 6/4/24
* Files in Text changed to Processing API to work for all devices
* Added Stereo Madness to Game

### 6/6/24
* Changed Text File reading and writing, combining all obstacles into 1 text file
* Changed placement switching of obstacles
* Implemented abstract Orb Class
* Implemented yellowOrb and its physics and display
