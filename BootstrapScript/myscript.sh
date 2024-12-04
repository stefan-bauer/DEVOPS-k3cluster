#!/bin/bash

# Exit on any error
set -e

# Install WireGuard
apt update && apt install -y wireguard vim jq

# Define directories and files
WG_DIR="/etc/wireguard"
WG_CONFIG="$WG_DIR/wg0.conf"


# Create wg0.conf
cat <<EOF > $WG_CONFIG
[Interface]
PrivateKey = SM3EUK3E6njMzXT9niAqNiiisB9xLk0eapO8z396YFs=
Address = 10.0.0.4/26
ListenPort = 51820

# Pegasus
[Peer]
PublicKey = h1gxUUhTH9YB4Tqah6aKeeHN4g2+0FNZtK6dqDuhW3I=
AllowedIPs = 10.0.0.3/32
Endpoint = 92.60.37.157:51820

# Andromeda
[Peer]
PublicKey = u5ka7J/Bi6793zOVtDUaTGB/u+3W5LKLMl8FZBGtzyM=
AllowedIPs = 10.0.0.2/32
Endpoint = 194.59.206.147:51820

# Local PC
[Peer]
PublicKey = +M05oyAQWdZZSj4y2STu49Gkfq7RLzp8ylO8ScgPKxw=
AllowedIPs = 10.0.0.61/32
EOF

# Set permissions
chmod 600 $WG_CONFIG

# Output details
echo "WireGuard configuration created at $WG_CONFIG"


# Enable and start WireGuard
wg-quick up wg0
systemctl enable wg-quick@wg0

echo "WireGuard wg0 interface is up and running."
