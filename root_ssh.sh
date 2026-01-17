#!/bin/bash

set -e

echo "[+] Iniciando proceso para habilitar SSH como root"

echo "[+] Actualizando sistema (apt update && apt upgrade -y)"
export DEBIAN_FRONTEND=noninteractive
apt update -y
apt upgrade -y

echo "[+] Comprobando si OpenSSH Server está instalado"

if ! dpkg -l | grep -q openssh-server; then
    echo "[!] OpenSSH Server no está instalado. Instalando..."
    apt install -y openssh-server
else
    echo "[+] OpenSSH Server ya está instalado"
fi

echo "[+] Comprobando estado del servicio SSH"

if systemctl is-active --quiet ssh; then
    echo "[+] SSH ya está activo"
else
    echo "[!] SSH no está activo. Activando..."
    systemctl enable ssh
    systemctl start ssh
fi

SSHD_CONFIG="/etc/ssh/sshd_config"

echo "[+] Configurando SSH para permitir root por contraseña"

cp "$SSHD_CONFIG" "${SSHD_CONFIG}.bak.$(date +%s)"

sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' "$SSHD_CONFIG"
sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' "$SSHD_CONFIG"
sed -i 's/^#\?UsePAM.*/UsePAM yes/' "$SSHD_CONFIG"

echo "[+] Reiniciando servicio SSH"
systemctl restart ssh

echo "[+] Proceso finalizado"
echo "[!] IMPORTANTE:"
echo "    - Root DEBE tener contraseña definida para poder entrar"
echo "    - Si no la tiene, SSH permitirá login pero fallará la autenticación"
echo "    - Define contraseña con: passwd root"
echo "[!] ACCESO SSH COMO ROOT POR CONTRASEÑA HABILITADO"
