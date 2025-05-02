#!/bin/bash

# Se a pasta estiver vazia, copiar ficheiros WordPress
if [ -z "$(ls -A /home/site/wwwroot)" ]; then
  echo "📁 A copiar WordPress para /home/site/wwwroot..."
  cp -a /var/www/html/. /home/site/wwwroot/
fi

# Iniciar Apache no foreground
apache2-foreground
