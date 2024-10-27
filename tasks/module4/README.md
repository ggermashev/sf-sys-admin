# Apache ([Dockerfile](./apache/Dockerfile))

- Проверка, что Apache работает

    ![alt text](assets/apache-works.png)

-  Скрин страницы по URL-адресу

    ![alt text](assets/hello-apache.png)

- Генерация SSL-сертификата

    ```
    openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out server.crt -keyout server.key -config /task/src/sslconfig.cnf
    ```

- [Настройка Apache для использования SSL-сертификатов](./apache/src/writeHttpsConfig.sh)

- Проверка доступности через HTTPS

  ![alt text](assets/apache-https.png)

# Nginx ([Dockerfile](./nginx/Dockerfile))

- Проверка, что Nginx работает

    ![alt text](assets/nginx-works.png)

- Скрин страницы по URL-адресу

    ![alt text](assets/hello-nginx.png)

- [Настройка прокси с балансировкой нагрузки](./nginx//src/nginx.conf)

  ![alt text](assets/nginx-python1.png)

  ![alt text](assets/nginx-python2.png)

- Генерация SSL-сертификата

  ```
  openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out nginx.crt -keyout nginx.key -config /task/src/sslconfig.cnf
  ```


- [Настройка https подключения](./nginx//src/nginx.conf)

  ![alt text](assets/nginx-python1.png)

- [Настройка ModSecurity в Nginx](./nginx//Dockerfile)

- [Настройка правил фильтрации ModSecutiry](./nginx//src/main.conf)

- Проверка защиты от SQL-инъекций

  ![alt text](assets/sql-injection.png)

- Результат без правила фильтрации

  ![alt text](assets/disabled-sql-rule.png)