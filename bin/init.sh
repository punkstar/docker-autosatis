#!/bin/bash

php /satis/bin/generate_apache_config.php /satis/apache/vhost.conf.twig /etc/apache2/sites-available/satis.conf

a2ensite satis

service cron start
service apache2 start

bash /satis/bin/refresh.sh
