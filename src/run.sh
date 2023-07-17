#!/bin/sh

echo 'Enabling Routing'
sysctl net.ipv4.ip_forward=1
echo 1 > /proc/sys/net/ipv4/ip_forward
echo 'Setting up iptables:'
echo "Send all packets on port: $DPORT/tcp to: $DIP $DPORT/tcp "
iptables -A FORWARD -j ACCEPT
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp --dport $DPORT -j DNAT --to-destination $DIP:$DPORT
if [ "$DEBUG_IPTABLES" = "true" ]; then
  echo 'DEBUG_IPTABLES is enabled !'
fi
echo 'Starting container main loop!'
while true; do
  sleep 15
  if [ "$DEBUG_IPTABLES" = "true" ]; then  
    iptables -t nat -L -n -v
  fi
done