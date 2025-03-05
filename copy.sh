#!/bin/bash

# Ansible Inventory Datei
INVENTORY="./ansible/inventory"
# Datei, die kopiert werden soll
SRC_FILE="html/*"
# Zielverzeichnis auf den Servern
DEST_DIR="/home/ubuntu/html"

# Extrahiere IPs aus [server]-Gruppe des Inventars
HOSTS=$(awk '/\[server\]/ {flag=1; next} /^\[/{flag=0} flag && NF {print $1}' "$INVENTORY")

# Prüfe, ob Hosts gefunden wurden
if [ -z "$HOSTS" ]; then
    echo "Keine Hosts in [server]-Gruppe gefunden."
    exit 1
fi

# Datei auf jeden Host kopieren
for HOST in $HOSTS; do
    echo "Kopiere $SRC_FILE nach $HOST:$DEST_DIR"
    ssh -i my_key.pem "sudo mkdir -p $DEST_DIR && sudo rm $DEST_DIR/* -rf"
    scp -i my_key.pem "$SRC_FILE" "user@$HOST:$DEST_DIR"
    ssh -i my_key.pem "sudo cp $DEST_DIR/* /var/www/html/"
done


echo "Kopieren abgeschlossen."
