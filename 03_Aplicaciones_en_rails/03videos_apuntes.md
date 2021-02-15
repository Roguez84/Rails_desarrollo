
## Creando el primer proyecto
Por defecto, cuando navegamos internet, usamos el port 80

#### Que es el servidor?
Servidor especifico que nos conectamos para lograr un proposito (e.g. ver una pagina web)

Tambien puede ser:
Programa que maneja peticion y entrega respuesta

Programa que havce la peticion se llama **cliente**. En caso de servidor web, el cliente es el browser

#### Que significa levantar el servidor?
Simplemente correr el programa encargado de manejar peticiones **request** y entregar la respuesta

#### Errores comunes
-Levantar servidor en un directorio que no contiene la carpeta que hemos creado en rails

-Tratar de levantar mas de una vez en el mismo port

## Creando una pagina web con el generador

Dos conceptos clave a la hora de crear una pagina en rails
1. Vista
2. Controlador

Para crear paginas en rails hay que hacerlo bajo un controlador. Los controladores agrupan paginas. Estas paginas se les conoce como vistas. Las vistas se encargan de disponibilizar la informacion

Se puede tener mas de un controlador

Los controladores llevan nombre en plural y en ingles

Para comenzar, hay que crear las paginas index y about desde el terminal. Y se generaran en un controlador 'pages':
```
rails generate controller pages index about
```

Despues de esto en el browser, se puedes escribir 'pages' despues de localhost:3000 (entonces se puede ver localhost:3000/pages/index)

Despues de ese ultimo comando, podemos, ya hay que abrir el directorio en el editor de texto.
Una vez en el editor de texto, podemos editar el contenido de las paginas que hemos creado (pages/index y pages/about) encontrando archivos .html.erb en la carpeta: app>views>pages


#### Contenido dinamico
Contenido dinamico es que la pagina vaya cambiando a medida que el usuario vaya interactuando con ella.

Para hacer esto, a los archivos .html.erb se les puede dar codigo ruby usando las etiquetas
```html
<%=  %>
```
Para escribir codigo ruby que se ejecute pero NO se muestre en la pagina se hace lo mismo que arriba pero sin el signo "="
```html
<%  %>
```

Lo que hace el controlador es --> 
1. evaluar si un archivo tiene la extension .html.erb 
2. Si la tiene, interpreta el codigo de Ruby, lo pasa a html y deja el archivo final (para pasarselo al navegador) como .html (sin .erb al final)


## Layouts y Rutas

#### Layouts
Esto tiene que ver con los elementos "maestros" que se van a repetir y muchas de las paginas de nuestra  aplicacion (ej: navbar)
Para evitar tener que escribir codigo que se repite en cada pagina, Rails usa el concepto de Layouts.
**El archivo que contiene esto es application.html.erb y Esta en ap>views>layout**. Por defecto/antes de hacer cualquier modificacion, se ve asi:
```html
<!DOCTYPE html>
<html>
  <head>
    <title>Proyecto</title>
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>

  <body>
    <%= yield %>
  </body>
</html>
```
*Ponerle especial atencion a la linea de arriba que contiene **<%= yield%>***. Esto sirve para cargar el contenido especifico que hemos declarado en cada archivo de la carpeta *pages*

#### Las Rutas
En rails existe un archivo que tiene todas las rutas (o URL) que estan disponibles para consumir.
Este archivo tambien tiene la referencia de cada ruta disponible ademas se debe saber quien debe manejar las peticiones.
Para hacer esto se establece la relacion entre una ruta, el controlador y la accion que va a realizar una peticion. Gracias a este archivo, podemos saber que archivo y que parte de un archivo se ejecutan cuando el usuario interactua con la pagina

En el archivo de rutas se puede:
-Agregar paginas nuevas sin necesidad de generadores
-Agregar/modificar la pagina de inicio (ej: la pagina de bienvenida de rails)

Este archivo se encuentra en la carpeta config y se llama **routes.rb**

Este archivo se puede editar manualmente para agregarle cosas, pero hay que acordarse de que si se le va a agregar una pagina en un controlador nuevo, tambien hay que crear el controlador en **app>controllers** en el archivo **pages_controller.rb**

#### Rutas parte 2
Existen 3 formas de ver las rutas que existen
1. Utilizar comando rails routes
2. En el browser entrar a http://localhost:3000/rails/info/routes 
3. Entrar a una pagina que no existe

Rails nos da la posibilidad de poner links a paginas existentes haciendo lo siguiente:
en el archivo *app>views>layouts>application.html.erb*
Para hacer esto, hay que revisar las rutas (con alguno de los metodos anteriores)
Donde queramos incluir estos links podemos usar este codigo (este ejemplo va a ser hecho con pages_index, y lo que se va a hacer es agregar _path y _url al final):
```html
    <%= pages_index_path %> <!--para obtener el path de pages_index-->
    <!-- el resulta es /pages/index-->
    <%= pages_index_url %> <!--para obtener el url de pages_index -->
    <!-- el resultado es http://localhost:3000/pages/index-->
```
Una vez que sabemos esto de arriba, podemos agregar links a alguna pagina. Se va a usar el tag **a** de html junto con lo de arriba para hacerlo

Entonces quedaria asi:
```html
    <a href="<%= pages_index_path %>">path</a>
    <a href="<%= pages_index_url %>">url</a>
```
Hay un metodo *link_to* de ruby que tambien nos permite hacer lo mismo que hicimos arriba

Por ejemplo, para agregar un link a la pagina *about* quedaria asi:
```html
    <%= link_to 'About', pages_about_url%>
```

#### Como cambiar el contenido de la pagina principal de localhost:3000 (por defecto muestra la pagina de bienvenida de Rails)

Para esto se usa el metodo root
Hay que ir al archivo de rutas **config>routes.rb**
Por ejemplo, si queremos que esa pagina de bienvenida sea index del controlador pages, hay que agregarle lo siguiente a **routes.rb**:

```html
root 'pages#index'
```

## Agregando una nueva pagina manualmente
Antes habiamos agregamos paginas a la aplicacion por medio de generador de controladores. Ahora lo vamos a hacer manual.