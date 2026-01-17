# 🚀 RootGate SSH

> Automatiza la habilitación de acceso **SSH como root por contraseña** en sistemas Debian/Ubuntu con un solo comando.

---

## 🧠 Descripción

**RootGate SSH** es un script Bash diseñado para administradores de sistemas, laboratorios, entornos de pruebas o máquinas recién desplegadas que necesitan habilitar rápidamente el acceso SSH como **root**, sin interacción manual.

El script se encarga de todo el proceso:

* Actualiza el sistema
* Instala OpenSSH Server si no está presente
* Habilita y arranca el servicio SSH
* Configura `sshd_config` para permitir login de root por contraseña
* Reinicia el servicio SSH

Todo de forma **automática y segura**, creando copias de respaldo del archivo de configuración.

---

## 📂 Contenido del proyecto

* `root_ssh.sh` – Script principal de automatización fileciteturn0file0

---

## ⚙️ Requisitos

* Sistema basado en **Debian / Ubuntu**
* Ejecutar como **root**
* Conexión a Internet (para instalar/actualizar paquetes)

---

## ▶️ Uso

```bash
chmod +x root_ssh.sh
sudo ./root_ssh.sh
```

---

## 🔐 Importante sobre la seguridad

⚠️ **Advertencia:**

Permitir acceso SSH como root por contraseña **no es recomendable en entornos de producción expuestos a Internet**.

### Recomendaciones:

* Usar solo en **entornos controlados**, laboratorios o máquinas temporales
* Proteger el servidor con firewall
* Cambiar la contraseña de root inmediatamente
* Considerar autenticación por **clave SSH** en producción

---

## 🔑 Nota importante

El usuario **root debe tener una contraseña definida**, de lo contrario el acceso SSH fallará.

```bash
passwd root
```



### 🛠️ Hecho para administradores que quieren **control total, sin clics**
