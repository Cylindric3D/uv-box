Basic States
============

* **STATE_STARTUP**
The firmware starts in the Startup state while setting up. In this state no user input is accepted. After startup is complete, the state moves to *STATE_READY*.

* **STATE_READY**
The firmare initially transitions to Ready once it has started up. In this state the user can use the encoder to select a time, and use the button to start the countdown. The LEDs are off. Clicking the button changes the state to *STATE_ACTIVE*.

* **STATE_ACTIVE**
This is the state when the countdown is running, and the LEDs are on. The user can use the button to stop the countdown. Note that the user can still use the encoder to bump the time up or down. After the countdown is complete, the state changes to *STATE_RESETTING*.

* **STATE_RESETTING**
This is a simple reset-state. After a preset time, the display will reset and the state will return to *STATE_READY*.

State Transitions
=================
* *STATE_STARTUP*
  * automatically to *STATE_READY*
* *STATE_READY*
  * button-click causes change to *STATE_ACTIVE*
* *STATE_ACTIVE* 
  * button-click causes change to *STATE_RESETTING*
  * countdown complete causes change to *STATE_RESETTING*
* *STATE_RESETTING*
  * automatically to *STATE_READY*