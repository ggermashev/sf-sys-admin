echo "$(
  echo -n " \n\
    LoadModule rewrite_module modules/mod_rewrite.so \n\
    LoadModule ssl_module modules/mod_ssl.so \n\
    LoadModule proxy_module modules/mod_proxy.so \n\
    LoadModule socache_shmcb_module modules/mod_socache_shmcb.so \n\
    LoadModule proxy_connect_module modules/mod_proxy_connect.so \n\
    LoadModule proxy_http_module modules/mod_proxy_http.so \n\
    LoadModule proxy_fdpass_module modules/mod_proxy_fdpass.so \n\
    LoadModule proxy_html_module modules/mod_proxy_html.so \n\
    LoadModule xml2enc_module modules/mod_xml2enc.so \n\
    Include conf/extra/httpd-ssl.conf \n\
  "; cat /usr/local/apache2/conf/httpd.conf)" > /usr/local/apache2/conf/httpd.conf

sed -i -e 's/www.example.com/127.0.0.1/g' /usr/local/apache2/conf/extra/httpd-ssl.conf

echo " \n\
<VirtualHost *:80>
  RewriteEngine On
  RewriteCond %{HTTPS} !=on
  RewriteRule ^/?(.*) https://%{SERVER_NAME}/$1 [R=301,L]
</VirtualHost>
<VirtualHost *:443> \n\
  ServerName 127.0.0.1
  ServerAdmin webmaster@localhost \n\
  ErrorLog ${APACHE_LOG_DIR}/error.log \n\
  CustomLog ${APACHE_LOG_DIR}/access.log combined \n\
  SSLEngine on \n\
  SSLCertificateFile /usr/local/apache2/conf/server.crt \n\
  SSLCertificateKeyFile /usr/local/apache2/conf/server.key \n\
  ProxyPass / http://server1:80/ \n\
  ProxyPassReverse / http://server1:80/ \n\
</VirtualHost>" >> /usr/local/apache2/conf/httpd.conf