What it does
============

This script rotates skyboxes for GoldSource engine games (HalfLife 1, Counter-Strike, Day of Defeat, each in its old, non-Source variant). It creates 8 copies of the skybox: rotated by 90, 180 and 270 degrees plus each flipped horizontally.
Rotation is only done around the z-axis, obviously.


Why
===

I was dissatisfied with the sky for a Day of Defeat map I made, and rotating the finished map is nearly impossible without breaking it.
I admit this is super obscure but maybe somebody will find use in it.


Dependencies
============

*	bash
*	imagemagick
*	a GoldSource game. Might work for different games that use this particular sky texture format (6 TGAs around a cube. See source.)


Usage
=====

Go to your game's sky texture directory. Should be something like
    Valve/game/gfx/env
where game stands for the mod in question (e.g. cstrike, dod).

Invoke the script with the sky's name as first argument. There are 6 files per sky - their names are the skyname with the direction (up, dn, lf, rt, ft, bk) and the tga extension. So if you want to rotate sky "ava", that has the files avalf.tga etc, call
    ./skyboxtransformer.sh ava
You will find 48 new files next to the original ones. They new direction (one integer) is inserted between sky name and direction, like
    ava3ft.tga
so you can use "ava3" as sky name in the Hammer editor. 0 is the original, 1 thru 3 are rotations by 90, 180 and 270 degrees, 4 thru 7 are their horizontally flipped versions.


Code
====

I don't do much bash so it's probably ugly.


License
=======

Free.
