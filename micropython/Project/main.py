# * * * * * * * * * * * * * * * * * #
# Python LED blink on esp8266       #
# Wemos D1 Mini Micropython script  #
# File: main.py                     #
# Author: Dmitri G.                 #
# Date: 2019-07-17                  #
# Version: 0.0.1                    #
# * * * * * * * * * * * * * * * * * #

import machine
import time

# LED GPIO 2 Init. LED will ON
led = machine.Pin(2, machine.Pin.OUT)

"""
The LED is connected to POSITIVE voltage
on Wemos D1 Mini board.
So, code will work in opposite.

"""

# Blink routine start
while True:
  time.sleep(1.0)  # Sleep is going...
  led.on()         # LED is OFF really
  time.sleep(1.0)  # Sleep is going...
  led.off()        # LED is ON really
