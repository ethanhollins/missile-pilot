--------------------------------VOLUMETRIC EXPLOSIONS--------------------------------
				  V1.1 MARCH 2018

FIXED: HDR CAMERA CAUSING WHITE SQUARES IN PARTICLES


Thank you for purchasing the Volumetric Explosions Asset.

If you have any problem or question, please mail me msureda2@gmail.com
I take customer support seriously and think it is a vital part in the Asset Store environment.

Please take your time and look at the example scenes included so you can understand how
these effects work before you include them onto your projects.

Use your scrollwheel to change between prefabs on the StreetExample sceene while in play mode.

Low Spec versions of the effects recommended for mobile.


--------------------------------CUSTOMIZING EFFECTS-----------------------------------

If you want to make your own effect using the resources this package provide, please take this
recommendations.

The explosions provided use Unity Particle Systems, if you want to modify any effect I encourage you
to duplicate the desired effect and play with the parameters a little bit.
Every effect has the same structure.

The parent GameObject it's an empty particle system (it doesn't spawn anything) with the explosion script.
This script is not essential, but has some interesting options.
Inside this GameObject there is a ParticleSystem called "Particles" this is the parent of every other
particle system in the effect. 

"Particles" is the particle system which spawns the volumetric mesh.
The fire color is based on the particle color, you can change it to whatever you want, and even make 
gradient transitions.

The smoke color is determined by the material. If you want to change the smoke color you should create
a new material instance and apply it to the "Particles" renderer section.
This material should have the "Volumetric Explosions/Explosion Particle" shader.
Inside the material you can change the SmokeColor and SmokeColor2 to the desired effect.

-------------------------------------------------------------------------------------------

