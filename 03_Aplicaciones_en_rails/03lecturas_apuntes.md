# Aplicaciones en Rails

Ruby on Rails o simplemente Rails, es un conjunto de herramientas especializadas en la construcción de aplicaciones web. Nos entrega soporte para múltiples motores de base de datos, creación de formularios y seguridad entre muchas cosas mas.
Su principales ventajas es que es sólido, rápido y escalable. Ruby on Rails es un framework de desarrollo web diseñado para que el desarrollador disfrute trabajar en el.

#### Ruby on Rails V.S Ruby
Rails no es lo mismo que Ruby, Ruby es un lenguaje de programación orientado objetos y Rails es un conjunto de herramientas construídas en Ruby para el desarrollo de aplicaciones web. Estos conceptos pueden enredarse debido a que la mayoria de las personas llegan a conocer Ruby para
hacer páginas web en Rails

## Instalando Rails y creando el primer proyecto
*Me voy a saltar varias paginas de esto que ya me se*

#### Que es el servidor?
A veces usamos el término del servidor para referirnos a un computador en específico al cual nos conectamos para lograr un propósito, por ejemplo ver una página web o descargar un archivo, pero también el término se ocupa para referirse al programa que maneja esta petición y entrega la respuesta.
El programa que hace la petición recibe el nombre de **cliente**, si estamos hablando de servidores web el cliente será el navegador

#### Que significa levantar el servidor?
Levantar el servidor es simplemente correr el programa encargado de manejar las peticiones (requests) y entregar las respuestas (response). Si el programa no está corriendo, no podremos acceder al servicio que este entrega.

### 2 Errores muy comunes al correr un servidor

1. Correr la instruccion rails s en el terminal, sin estar en el directorio de nuestro proyecto
2. Tratar de correr 2 servidores en el mismo puerto (no se pueden correr 2 servidores en el puerto 3000 por ejemplo)

## Creando una pagina web con el generador (pagina 10 de 63)
*Me lo voy a saltar, ver los apuntes de los videos*
## Contenido dinamico (15 de 63)
*Me lo voy a saltar, ver los apuntes de los videos*
## Layouts (20 de 63)
*Me lo voy a saltar, ver los apuntes de los videos*
## Las rutas (24 de 63)
*Me lo voy a saltar, ver los apuntes de los videos*
## Agregando una nueva pagina manualmente (32 de 63)
Antes agregamos paginas usando un generador de controladores, ahora haremos el proceso manualmente.
*(de ejemplo se agregara una pagina team al controlador pages)

Para hacer esto hay que:
1. Abrir el archivo **config>routes.rb**
2. Agregar nueva ruta con **get pages/team**
3. Agregar el "metodo" team al controlador en **app>controllers>pages_controller.rb** con **def team end**
 4. Crear nuevo archivo dentro de app>views>pages y ponerle de nombre **team.html.erb**

## Imagenes y el asset path (35 de 63)
##### Objetivos
-Agregar imágenes dentro de la vista
-Utilizar la carpeta public para guardar assets
-Conocer las ventajas de utilizar el asset_path
-Conocer el helper image_tag

Aqui van a explicar como anadir css, js, imagenes, etc

#### Assets
Tipos de assets incluyen:
-Archivos CSS
-Archivos JS
-Tipografias
-Videos

Hay 2 formas de agregar estos archivos a una aplicacion de rails:
1. A traves de la carpeta **public**
2. A traves del **asset_path**

Usando la carpeta public:
Esta carpeta esta a nivel raiz del proyecto, asi que es muy facil de usar. Podemos acceder a los archivos directamente a traves de la url. Osea las accedemos simplemente usando:
```
localhost:3000/nombre_de_la_foto.png
```
Despues, para usar la imagen en algua de las paginas de la app, hay que simplemente hacer lo tipico de html con:
```html
<image src="/nombre_de_la_foto.png">
```
El problema de usar la carpeta **public** para poner fotos es que a esa carpeta en particular no la podemos optimizar con Rails. Por eso en general es mejor usar el **asset_path**

El asset_path esta en **app>assets**. Para usar alguna foto que hemos guardado ahi, se usa el **image_tag**:
```html
<%= image_tag 'nombre_de_foto.png' %>
```
el metodo image_tag, puede recibir mas argumentos tambien. image_tag(source,options={})

Otros detalles clave:
El metodo image_tag busca dentro de todas las carpetas del asset_path, por ejemplo si movemos nuestro archivo a la carpeta *app/assets/css* de todas formas podremos ver el resultado

Las carpetas dentro del asset_path se leen en orden lexicografico y se devuelve el primer archivo encontrado. Esto quiere decir que si guardamos un archivo con el mismo nombre en *assets/images* y en *assets/stylesheets* el archivo dentro de *assets/images* sera el que se muestre
## CSS y layout (42 de 63)
##### Objetivos:
-Invocar CSS desde el layout
-Conocer las ventajas del asset pipeline
-Conocer y modificar el manifiesto
-Conocer el orden de carga de los archivos CSS
-Comprender las directivas del manifiesto

Existen dos maneras de agregar archivos css. Igual que antes, estas son por medio de la carpeta **public** y por el **asset path**
*Nos vamos a saltar la manera de hacerlo por public*

Para hacer esto hay que guardar un archivo css en la ruta *app>assets>stylesheets*

Lo que hace que el archivo que guardamos en la ruta de arriba se aplique, es la siguiente linea de codigo que se puede ver en el layout:
```html
<%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
```
Lo que esta haciendo esta linea es cargar el archivo **application.css** (conocido como el **manifest**) que esta ubicado dentro de **app>assets>stylesheets**.

#### Analizando el manifest
Dentro del manifest, se pueden ver dos directivas:
```css
*= require_tree .
*= require_self
```
Algo curioso es que estas directivas estan comentadas dentro del archivo. (*la lactura dice que es para no confundirse o causar errores con el CSS dentro del archivo*)

##### Directiva *= require_tree .
Esta directiva carga todos los css que estan dentro de la carpeta stylesheets en orden alfabetico

##### Directiva *= require_self
Esta directiva indica que se carga el css que aparece dentro del archivo. Como dijimos anteriormente, esto no se va a ser, pero va a quedar la instruccion igual

##### otros archivos
Si queremos que se carguen otros archivos aparte de los que estan en la carpeta stylesheets se necesita:
```css
*= require nombre_archivo.css
```
La libreria que procesa estas directivas y convierte todos estos assets en un unico archivo se llama **Sprockets**

Lo ultimo clave a notar es que el orden de estas instrucciones SI importa
## El gemfile (46 de 63)
Una gema contiene en su interior codigo que puede ser "required" desde cualquier proyecto

Para poder requerir o importar gemas en nuestros proectos raisl, se usa n archivo llamado **gemfile**

En rails, este archivo se crea al momento de generar el proyecto y se encuentra en la raiz del directorio

El gemfile tiene la lista de dependencias, pero estas no se agregan automaticamente a los proyectos. Para instalarlas hay que usar una gema que se llama **bundler**. Bundler es una gema que sirve para administrar todas las gemas de un proyecto y funciona leyendo el contenido del archivo gemfile

Para usar bundler, primero hay que instalarlo con:
```
gem install bundler
```
una vez que ya esta insalado, se puede ejecutr el comando: 
```
bundle install
```
Esto se encargara de actualizar las gemas listadas en el gemfile. Al ejecutar este comando se generara un archivo llamado Gemfile.lock, este archivo tiene todas las gemas y las dependencias de las gemas que estamos agregando al proyecto

#### Gemfile.lock

A veces hay gemas que solo queremos usar dentro de ciertos ambientes. Para esto se usa el metodo **group** y se puede usar de 2 maneras distintas:
1. agregando el ambiente a la gema
``` ruby
gem 'sqlite3', group: :development
gem 'pg', group: :production
```

2. Agregando la gema dentro de un bloque con el nombre del ambiente:
```ruby
group :development do
    gem 'sqlite3'
end

group :production do
    gem 'pg'
end
```


## Heroku - Subiendo una aplicacion (51 de 63)
*Me lo voy a saltar por ahora*
## Integrar una plantilla al proyecto (57 de 63)
En internet se pueden conseguir plantillas gratis en phantom https://html5up.net/phantom
Una vez en esta pagina, vamos a hacer click en "download" y se va a bajar un .zip.
Cuando tengamos este .zip, vamos a extraer los archivos en assets>css y assets>js y los vamos a copiar en el asset path de nuestro proyecto

Despues de tener estos archivos, tenemos que editar el layout homologandolo para que se parezca al index.html de phantom. 