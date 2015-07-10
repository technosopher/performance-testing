#!/bin/bash

# Usage: ./throttle.sh <number of Mbits/sec connection should be throttled to> <IPv4 address of other party>
# Example: ./throttle.sh 20 10.0.0.1 will throttle the connection from/to 10.0.0.1 to 20 mbits
tc qdisc del dev eth0 root
tc qdisc add dev eth0 root handle 1: htb default 30
tc class add dev eth0 parent 1: classid 1:1 htb rate "$1"mbit
tc class add dev eth0 parent 1: classid 1:2 htb rate "$1"mbit
tc filter add dev eth0 protocol ip parent 1:0 prio 1 u32 match ip dst $2 flowid 1:1
tc filter add dev eth0 protocol ip parent 1:0 prio 1 u32 match ip src $2 flowid 1:2
