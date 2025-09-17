# Docker con Laravel 12.x y Mysql
  ## Levantar el proyecto:
  `docker-compose up -d`

  ## Instancia efimera  
  Puedes ejecutar una instancia efímera de Laravel usando Docker con el siguiente comando, que monta tu carpeta local laravel y elimina el contenedor al salir:

  `docker run --rm -it -p 8000:8000 -v "$(pwd)/laravel:/var/www/html/laravel" -w /var/www/html/laravel laravelphp:latest php artisan serve --host=0.0.0.0 --port=8000`

   ### Explicación:

   - **--rm :** Elimina el contenedor al salir.
   - **-it :** Interactivo.
   - **-p 8000:8000 :** Expone el puerto 8000.
   - **-v "$(pwd)/laravel:/var/www/html/laravel" :** Monta tu carpeta local.
   - **-w /var/www/html/laravel :** Establece el directorio de trabajo.
   - **laravelphp:latest :** Usa la imagen de Laravel (ajusta el nombre si usas otra).
   - **php artisan serve --host=0.0.0.0 --port=8000 :** Inicia el servidor de desarrollo.
   