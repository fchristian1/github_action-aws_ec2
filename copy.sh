#!/bin/bash

# Ansible Inventory Datei
INVENTORY="./ansible/inventory"
# Quellverzeichnis mit den zu kopierenden Dateien
SRC_DIR="html/"
# Temporäres Verzeichnis auf dem Server
DEST_DIR="/home/ubuntu/deploy_html"
# SSH-Schlüssel für die Verbindung
SSH_KEY="my_key.pem"
# Zielverzeichnis für den Webserver (Root)
WEB_DIR="/var/www/html"

# Extrahiere IPs aus der [server]-Gruppe des Ansible-Inventars
HOSTS=$(awk '/\[server\]/ {flag=1; next} /^\[/{flag=0} flag && NF {print $1}' "$INVENTORY")

# Prüfe, ob Hosts gefunden wurden
if [ -z "$HOSTS" ]; then
    echo "Keine Hosts in [server]-Gruppe gefunden."
    exit 1
fi

# Datei auf jeden Host kopieren
for HOST in $HOSTS; do
    echo "Verbinde mit $HOST und übertrage Dateien..."

    # Erstelle das temporäre Verzeichnis und entferne alte Dateien
    ssh -i "$SSH_KEY" ubuntu@$HOST "mkdir -p $DEST_DIR && sudo rm -rf $DEST_DIR/*"

    # Kopiere das HTML-Verzeichnis auf den Remote-Server
    scp -i "$SSH_KEY" -r "$SRC_DIR" "ubuntu@$HOST:$DEST_DIR"

    # Lösche alte Webdateien und verschiebe **den Inhalt** von html/ ins Root-Verzeichnis
    ssh -i "$SSH_KEY" ubuntu@$HOST <<EOF
        sudo rm -rf $WEB_DIR/*
        sudo mv $DEST_DIR/html/* $WEB_DIR/
        sudo rm -rf $DEST_DIR/html  # Entferne leeren html-Ordner
EOF

    echo "Deployment auf $HOST abgeschlossen!"
done

echo "Alle Server aktualisiert!"
