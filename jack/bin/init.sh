#!/bin/sh

jack_control ds oss
jack_control dps wordlength 32
jack_control dps device /dev/dsp4
