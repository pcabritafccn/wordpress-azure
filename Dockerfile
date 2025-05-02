FROM wordpress:php8.1-apache

# Copiar script de arranque personalizado
COPY startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

# Substituir o VirtualHost para apontar para o volume do Azure
RUN sed -i 's!/var/www/html!/home/site/wwwroot!g' /etc/apache2/sites-available/000-default.conf

# Ativar mod_rewrite
RUN a2enmod rewrite

# Apontar para o diretório correto
WORKDIR /home/site/wwwroot

# Script de arranque
CMD ["/usr/local/bin/startup.sh"]
