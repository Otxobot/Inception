#!/bin/sh

# The command line interface for WordPress: https://wp-cli.org 

sed -i 's|PHP_PORT|'${PHP_PORT}'|g' /etc/php/7.4/fpm/pool.d/www.conf

if [ -f "/var/www/html/wp-config.php" ]

then
  echo "Wordpress is in --path=$WP_PATH"
else
  cd /var/www/html
  rm -rf *
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
  #wp --info
  wp core download --allow-root
  # chown -R www-data:www-data $WP_PATH
  wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --path=$WP_PATH --skip-check
  wp core install --allow-root --path=$WP_PATH --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_USER --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL --skip-email
  wp user create abasante abasante@42.fr --allow-root --role=author --path=$WP_PATH --user_pass=abasante
fi

/usr/sbin/php-fpm7.4 -F
