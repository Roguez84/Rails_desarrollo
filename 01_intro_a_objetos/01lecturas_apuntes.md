## Introduccion a objetos

Los 3 conceptos mas importantes
-Clase
-Instanciar
-Instancia: La instancia es el producto final o sea cuando escribimos a = [2,3,4,5] lo que queda guardado
dentro de a es un objeto, en este caso esta instancia es del tipo array.
La instancia también recibe el nombre de objeto, por lo que podemos decir que una instancia es del
tipo array o podemos decir que un objeto es del tipo array


*Los nombres de las clases deben empezar con mayuscula*

*No confundir con las constantes. En las constantes, el nombre entero va en mayuscula*

## UML (pagina 4 de 53)

Son diagramas que nos ayudan a vizualizar las clases

En el primer rectangulo del diagrama UML, va el nombre de la clase. En el segundo rectangulo van los atributos, y en el tercer rectangulo van los metodos

## Agregando comportamiento a los objetos

#### Que es un comportamiento
El comportamiento son los metodos. Los metodos permiten realizar acciones

Ejemplos de metodos en arrays:
```ruby
[1, 2, 3, 4].include? 2 # => true
[1, 2, 3, 4].size() # => 4
```
A estos metodos se las llaman **metodos de instancia**. Estos estan definidos dentro de cada clase.

Los metodos de instancia solo se puede ocupar para instancias en particular, osea no podemos llamarlas solas en el main ni tampoco llarselas a las clases. Ejemplos de errores:
```ruby
#asumiendo que creamos una clase Persona y creamos un metodo saludar()

saludar() # undefined method `saludar' for main:Object
Persona.saludar # undefined method `saludar' for Persona:Class
```

## Los estados de im objeto (pagina 9 de 53)
Estado se refiere al contenido que tiene un objeto. Por ejemplo Algun objeto array o hash, su estado es lo que tienen guardado

Para guardar estados de un objeto, se utilizan las variables de instancia. Estas empiezan con @

Ejemplos de variables de instancia creados en metodos de instancia
```ruby
class Vehiculo
    
    def encender()
        @encendido = 'on'
    end
    
    def apagar()
        @encendido = 'off'
    end
    
    def estado()
        @encendido
    end
end
```
Ejemplo de los objetos y estados que podemos declarar con lo decrito arriba:
```ruby
a1 = Vehiculo.new
a2 = Vehiculo.new
a1.apagar
a1.estado
a2.encender
a2.estado
```

A diferencia de las variables locales, las variables de instancia pueden ser accesidas por todos los metodos de una instancia

## Principio de encapsulacion (13 de 53)

Encapsulacion es basicamente que ls estados internos deben estar protegidos del exterior
*(Por ejemplo en Ruby, las variables de instancia no pueden ser accedidas en el main)*
El punto es que los estados internos de un objeto, solo pueden ser accedidos mediante a metodos

#### Setters y getters
cuando se necesita acceder a un estado (variable de instancia) se tienen que crear metodos. Estos metodos en particular son muy comunes asi que les pusieron los nombres de getters (para ver variables de instancia) y setters (para editar variables de instancia)

*Despues ensenaron como escribir los setters y getters pero me lo voy a saltar porque ya los se*

## El metodo constructor (18 de 53)

Es basicamente el initialize.
*Saltado porque ya me lo se*

## Reutilizando codigo (25 de 53)
El punto:
-Cargar objetos desde otros archivos
-Diferenciar require de require_relative

Para cargar codigo desde otros archivos se usa 
```ruby 
require_relative nombre_del_archivo.rb
#especificar la extension .rb no es necesario
```
require_relative, asume que estamos cargando un archivo .rb y que esta en el mismo directorio que en el que estamos trabajando. (No es necesario especificar .rb)

Para llamar a un archivo por medio de IRB, se necesita poner el nombre del archivo en ' '

#### require vs require_relative
require_relative es para los archivos que nosotros creamos y require es para otros que no hemos escrito nosotros (ej: gemas)


## Asociaciones (28 de 53)
Empezamos a ver tema de cardinalidad entre objetos (parecido a como era con las bases de datos) y como diagramarlos (UML)

#### Cardinalidad 0
 En este caso una mascota debe pertenecer a una persona, pero una persona no tiene porque tener una mascota (La clave es ponerle un atributo por defecto de *nil* al constructor de la clase Persona)

```ruby
class Persona
    
    attr_accessor :nombre, :mascota
    
    def initialize(nombre, mascota=nil)
        @nombre = nombre
        @mascota = mascota
    end
end

class Mascota  
    attr_accessor :nombre    
    def initialize(nombre)
        @nombre = nombre
    end
end

mascota1 = Mascota.new("Fido")
persona1 = Persona.new("Fernanda", m1)
```

#### Cardinalidad N
la clave aqui es poner nil en el initialize pero crear una variable de instancia que es un array. Despues Ir agregandole elementos a este array
```ruby
class Persona
    attr_accessor :nombre, :mascotas
    def initialize(nombre, mascota = nil)
        @nombre = nombre
        @mascotas = []
        @mascotas.push mascota
    end
end

class Mascota    
    attr_accessor :nombre   
    def initialize(nombre)
        @nombre = nombre
    end
end


m1 = Mascota.new('Seymour')
p1 = Persona.new('Fry', m1)
m2 = Mascota.new('Nibbler')
p1.mascotas.push m2
```

## Introduccion a la identidad (34 de 53)
dos objetos que tienen el mismo contenido no implica que sean exactamente el mismo objeto
Se puede ocupar el método .object_id para conocer el identificador de un objeto:
```ruby
 .object_id 
 ```
 
 Otras cosas importantes:
 -INT, floats, simbolos... si tienen el mismo valor, tienen el mismo object_id
 -dos strings iguales, tienen distintos id
 -dos arrays con los mismos elementos, tienen distintos id

```ruby
    #integers
    2.object_id # 5
    2.object_id # 5

    #simbolos
    :hola.object_id #1289948
    :hola.object_id #1289948

    #arrays
    puts [1,2,3,4].object_id # 70110849102780
    puts [1,2,3,4].object_id # 70110858362060

    #strings
    puts 'hola'.object_id # 70166159749440
    puts 'hola'.object_id # 70166159747080
 ```


## Identidad y variables (38 de 53)
El punto aqui es que el mismo objeto puede estar en multiples variables. Entonces si modificamos una de las variables, tambien se va a cambiar la otra. Esto es porque estamos modificando el objeto.

```ruby
#Esto es con l oque hay que tener cuidado

# Si trabajamos con el mismo objeto.
a = [1, 2, 3 , 4]
b = a
# En la variable b guardamos a
puts a.object_id == b.object_id # true
a[0] = 8
print b # [8, 2, 3, 4]
# Al cambiar a, cambiamos b
 ```

 Lo que si se puede hacer, es:
 Si dos variables tienen el mismo objeto, una de esas dos variables se le puede asignar un nuevo (Class.new) sin alterar que la otra variable tiene el objeto original

## Mutabilidad (42 de 53)
En ruby la mayoría de los objetos son mutables, esto quiere decir que su estado (alguno de sus atributos) pueden cambiar.

Pero, ¿Qué es cambiar de estado?

Un objeto cambia de estado cuando se modifica uno de sus atributos

Un objeto está compuesto de métodos y atributos, cuando sus atributos pueden cambiar debido al llamado de un método entonces, se puede inferir que el objeto es mutable.

Casi todo objeto puede llegar a tener un método que modifique algún atributo, por lo mismo mas que preocuparse de si el objeto es mutable o no, se debe poner atención en los métodos que se llamarán y los efectos que estos puedan tener

#### Creando un método que modifique el estado
Basicamente, lo que ya hemos hecho, usando setter.
Aqui cambiamos una variable de instancia del objeto, por ende, mutamos

#### Creando un método que no modifique el estado
*Esto si es nuevo*

La clave aqui es que creamos un metodo que tiene adentro Clase.new
```ruby
class Persona
    def initialize(nombre, caminado = 0)
        @nombre = nombre
        @caminado = caminado
    end

    def caminar(km = 1) #Este es el metodo clave
        Persona.new(@nombre, @caminado + km)
    end

    def caminado
        @caminado
    end
end
p1 = Persona.new("Daniel")
p2 = p1.caminar(10)
 ```
Cuando se llama a un método inmutable , siempre como resultado se tiene que se ha creado un nuevo objeto. 

Por ejemplo cuando se concatenan dos strings. Al llamar al método .+ del string "hola" se genera un objeto nuevo sin modificar el anterior.

Recordemos que .+ es un método
Dentro de ruby los operadores son métodos de instancia de una clase.



#### ¿Modificar o no modificar?
*Hablan de la diferencia en crear metodos que modifican al objeto original, vs los metodos que retornan una copia del objeto*

La ventaja de los métodos que no modifican el estado de un objeto es que difícilmente que puedan afectar nuestro código por descuido. La ventaja de los que si los modifican es que no requieren de la creación de un objeto nuevo.

## Manejo de excepciones (49 de 53)
*Cubro el 80-20 en los apuntes de clases asi que esto me lo voy a saltar*