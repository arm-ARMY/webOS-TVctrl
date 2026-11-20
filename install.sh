#!/bin/sh

INSTALL_DIR="/home/root/Apps"
SCREENCAP_DIR="/home/root/Apps/ScreenCap"

mkdir -p "$INSTALL_DIR" "$SCREENCAP_DIR"
cp -f "$(dirname "$0")/tvctrl" "$INSTALL_DIR/tvctrl"
chmod +x "$INSTALL_DIR/tvctrl"

if ! grep -q "$INSTALL_DIR" /home/root/.profile 2>/dev/null; then
    echo "export PATH=\"\$PATH:$INSTALL_DIR\"" >> /home/root/.profile
fi

printf "[*] tvctrl installed to %s\n" "$INSTALL_DIR"
printf "[*] Screenshot directory created at %s\n" "$SCREENCAP_DIR"
printf "[i] Run '. /home/root/.profile' or reconnect SSH to use 'tvctrl' from anywhere.\n"
