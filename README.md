# Requisitos previos
Para la utilización de esta VM es necesario tener instalado previamente [VirtualBox](https://www.virtualbox.org/wiki/Downloads) y [Vagrant](https://www.vagrantup.com/downloads.html)

# Instalación

1. Clonamos el repositorio
```
$ git clone https://github.com/yoniihdc/pokemonClientReact.git
```

2. Nos movemos al directorio clonado e iniciamos la instancia de Vagrant, puede tardar unos minutos, dependiendo de tu conexión:
```
$ cd pokemonClient
$ vagrant up
```

3. Accedemos a la máquina virtual para poder utilizar las herramientas instaladas
```
$ vagrant ssh
```

----
# NOTA

Si deseas cambiar la carpeta compartida con el nombre de tu proyecto antes de iniciar la instncia tienes que modificar el documento `provision/default.yml` en la sección de  `synced_folder` agregando el **PATH** de la carpeta que desees compartir, si se encuentra en un directorio diferente

