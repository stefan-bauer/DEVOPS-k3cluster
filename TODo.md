


sudo apt install -y curl iptable


cat <<EOF > ~/config.yaml
tls-san:
    - app.wildelements.net
    - 194.59.206.147
flannel-backend: wireguard-native
flannel-iface: wg0
node-ip: 10.0.0.2
node-external-ip: 194.59.206.147
advertise-address: 10.0.0.2
cluster-init: true
EOF


cat <<EOF > ~/config.yaml
tls-san:
    - app.wildelements.net
    - 194.59.206.147
flannel-backend: wireguard-native
flannel-iface: wg0
node-ip: 10.0.0.2
node-external-ip: 194.59.206.147
advertise-address: 10.0.0.2
cluster-init: true
EOF


cat <<EOF > ~/config.yaml
tls-san:
    - app.wildelements.net
    - 194.59.206.147
flannel-backend: wireguard-native
flannel-iface: wg0
node-ip: 10.0.0.2
node-external-ip: 194.59.206.147
advertise-address: 10.0.0.2
cluster-init: true
EOF

sudo mkdir -p /etc/rancher/k3s && sudo cp ~/config.yaml /etc/rancher/k3s/config.yaml

curl -sfL https://get.k3s.io | sudo sh -s - server

sudo cp /etc/rancher/k3s/k3s.yaml ~/k3s.yaml && sudo sed -i s/127.0.0.1/194.59.206.147/g ~/k3s.yaml

sudo chown andromedaadmin:andromedaadmin k3s.yaml 


sudo systemctl restart k3s
