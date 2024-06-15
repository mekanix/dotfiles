#!/bin/sh

sudo sysctl hw.usb.uaudio.buffer_ms=1
jack_control start
