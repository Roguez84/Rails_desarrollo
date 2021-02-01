# Profundizando en objetos

## Herencia (9 de 40)
Ejemplo de una clase Hija heredando de una clase llamada Padre
```ruby
class Padre
    attr_accessor :nombre
    def initialize(nombre)
        @nombre = nombre
    end
end

class Hija < Padre
end

fernanda = Hija.new("Fernanda")
fernanda.nombre
```
En este ejemplo de herencia, Hija posee todos los metodos y atributos de Padre

#### Especializacion
Cuando una clase hereda de otra, lo que podemos hacer es especializarla. Osea agregarle o cambiarle cosas a Hija que Padre no tenia

Para sobresribir un metodo, hay que crear un metodo en Hija que tenga el mismo nombre del que queremos sobrescribir del metodo Padre

#### Superclase y subclase
A veces uno se refiere a la clase padre como superclase y la clase hija como subclase

En UML, la subclase se dibuja con una flecha apuntando hacia la superclase


#### Super (14 de 40)
Super permite llamar a un metodo de una superclase que se llama exactamente igual. Esto es para sobrescribir alguna parte sin tener que escribir todo de nuevo
Ejemplo de llamar a super
```ruby
class X
    def metodo_complejo
        puts "durante"
    end
end

class Y < X
    def metodo_complejo
        puts "antes"
        super()
        puts "después"
    end
end

Y.new.metodo_complejo
#esto retorna:
#antes
#durante
#despues
```


#### Cadena de ancestros (15 de 40)
Cuando hay una cadena de herencias, se puede ver la herencia completa con
```ruby
.ancestors
```

ejemplo:
```ruby
class Abuelo
end

class Padre < Abuelo
end

class Hijo < Padre
end

Hijo.ancestors # Retorna este array => [Hijo, Padre, Abuelo, Object, Kernel, BasicObject]
```
En ruby una clase solo puede heredar de una otra clase.

#### Variables de clase (17 de 40)

#### Principio de encapsulacion

#### Metodos de Clase

#### Self (23 de 40)

## Polimorfismo (26 de 40)
En programación, los objetos de comunican a través de mensajes; en Ruby, este comportamiento se lleva a cabo a través del llamado a métodos. Es decir, la comunicación entre objetos es a través de métodos.

Poli-morfismo: Cualidad de tener muchas formas.

El principio de polimorfismo consiste en que dos objetos, de distina clase, pueden  responder al mismo método de forma distinta.

**No me queda tan claro cual es la diferencia entre esto y el concepto de especializacion visto en Herencia*

Lo que se busca evitar con poliformismo es el exeso de ifs. Sre busca evitar esto:
```ruby
class Animal
    def hablar
        if self.class == Perro
            puts 'Guau'
        elsif self.class == Gato
            puts 'Miau'
        elsif self.class == Vaca
            puts 'Muuu'
        end
    end
end

class Perro < Animal
end

class Gato < Animal
end

class Vaca < Animal
end

Perro.new.hablar # Guau
Vaca.new.hablar # Muuu
```
Y que en vez, se escriba asi:
```ruby
class Animal
end

class Perro < Animal
    def hablar
        puts 'Guau'
    end
end

class Gato < Animal
    def hablar
        puts 'Miau'
    end
end

class Vaca < Animal
    def hablar
        puts 'Muuu'
    end
end

Perro.new.hablar # Guau
Vaca.new.hablar # Muuu
```
## Modulos y mixins (29 de 40)
Los módulos tienen 4 funciones principales:
1. Agrupar constantes
2. Agrupar métodos
3. Agrupar clases
4. Evitar colisiones de nombre

Cabe destacar que estas funciones no son excluyentes entre ellas. Un mismo módulo puede agrupar constantes, métodos y/o clases

Para declarar métodos pertenecientes al
módulo debemos hacerlo con la instrucción self (como si fuera un método de clase). Para acceder a los elementos contenidos en un módulo debemos utilizar la notación ::

#### Agrupando constantes
Vamos a definir unas constantes en un modulo que vamos a pode usar despues.
Aqui mostrare la definicion y como se le llama
```ruby
module MyMath
    PI = 3.14
    E = 2.718
end

puts MyMath::PI # 3.14
puts MyMath::E # 2.718
```

#### Agrupando metodos

Es mas facil verlo con un ejemplo:
```ruby
module MyMath
    PI = 3.14
    E = 2.718
    
    def self.sumar(x, y)
        x + y
    end
    
    def self.restar(x, y)
        x - y
    end
    
    def self.multiplicar(x, y)
        x * y
    end
end

MyMath.sumar(4,3) # 7
MyMath.restar(4,3) # 1
MyMath.multiplicar(4,3) # 12
```

#### Agrupando clases
La idea de agrupar clase es para que no hayan problemas si dos clases tienen el mismo nombre. Estas dos clases con el mismo nombre no se confundiran porque pertenecen a modulos distintos, entonces como siempre especificamos el nombre del modulo, sabremos a cual de las clases estamos llamando
```ruby
module ActiveRecord
    class Base
    end
end

module ActionView
    class Base
    end
end
```
En el ejemplo de arriba, Existe más de una clase llamada Base , sin embargo, podemos acceder a ActiveRecord::Base y
ActionView::Base como clases que, a pesar que tienen el mismo nombre, son distintas.

#### Mixins

Para incorporar metodos definidos en un modulo como metodos de instancia, se usa
```ruby
include nombre_de_modulo
```
ejemplo:
```ruby
module Nadador
    def nadar
        puts 'Puedo nadar!'
    end
end

class Gato
end

class Perro
    include Nadador
end

bobby = Perro.new
puts bobby.nadar # Puedo nadar!
```
Para incluir metodos de un modulo como metodos de clase se usa 
```ruby
extend nombre_de_modulo
```
ejemplo:
```ruby
module Nadador
    def nadar
        puts 'Puedo nadar!'
    end
end

class Gato
end

class Perro
    extend Nadador
end

Perro.nadar # Puedo nadar!
```

Con mixins, podemos resolver el tema de la multiherencia (el hecho de que una clase solo pueda heredar de UNA otra clase). Una clase puede llamar a varios modulos

## Gosu (36 de 40)
Gosu es un framework para desarrollar juegos de videos en Ruby y C++.

*Esta seccion es para poner lo previo en pracita. Me la voy a saltar por ahora*