#!/binb/bash
bluetoothctl
power on
agent on
scan on
pair 12:34:60:12:03:FA
trust 12:34:60:12:03:FA
connect 12:34:60:12:03:FA
