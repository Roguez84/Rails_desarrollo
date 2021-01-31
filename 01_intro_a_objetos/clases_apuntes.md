

Manera en Ruby de crear setters y getters en una clase
```ruby
class Persona

    #def set_nombre(nombre) #Ruby acepta esta sintaxis que es la misma que en la mayoria de los otros lenguajes.
    def nombre=(nombre) #setter. Esta es la sintaxis bonita de ruby que hace lo mismo que la linea de arriba
        @nombre = nombre
    end

    #def get_nombre #getter. Ruby acepta esta sintaxis que es la misma que en la mayoria de los otros lenguajes.
    def nombre #getter. Esta es la sintaxis bonita de ruby que hace lo mismo que la linea de arriba
        @nombre
    end

    def edad=(edad) #setter.
        @edad = edad
    end


    def edad #getter
        @edad
    end

end
```

En la mayoria de los lenguajes, hay que crear TODOS los setters y TODOS los getters para cada atributo. Pero Ruby tiene lo que se llama metaprogramacion (codigo que genera codigo) para ayudar con esto

Metodo attr, Ruby hace que se generen tantos setters como getters. Esto hace lo mismo que lo de arriba
```ruby
class Persona

    attr_write :nomre, :edad #Creo que este es setter
    attr_reader :nombre, :edad #Creo que este es getter
kv
end
```

Mas resumido aun, lo mismo de arriba se puede hacer asi:
```ruby
class Persona
    
    attr_accessor :nombre, :edad #Esto crea la misma cantidad de setters que de gettters

end
```

Aprendimos que se puede dar valores por defecto al iniciar una instancia de la clase con def initialize
```ruby
class Producto
    def initialize(nombre, stock=0)
        @nombre = nombre
        @stock = stock
    end
end

producto1 = Producto.new("jabon", 10);
producto2 = Producto.new("bebida")
```

*Existe un metodo para arrays que es .sample(). Lo que hace es elegir un elemento del array al azar*


## Begin - rescue
Sirve para que ruby intente algo, pero si no funciona, que haga algo distinto. rescue rescata CUALQUIER tipo de error (vs capturar un tipo de error en particular como)

```ruby
begin
    puts 'a' + 2 #Esto va a tirar un error asi que se va a ignorar y pasar a rescue
rescue
    puts "hubo un error" #Despuse de mostrar esto, Ruby va a continuar hacia abajo
end
```
#### Capturar tipos de errores especificos

Lo de abajo solo va a funcionar SOLO si el tipo de error es TypeError. Ademas, va a guardar el error en una variable "e". Si el error NO ES del tipo TypeError, el codigo se va a quebrar.
```ruby
begin
    puts 'a' + 2 #Esto va a tirar un error asi que se va a ignorar y pasar a rescue
rescue TypeError => e #esta notation, es especifica para guardar el texto del error
    puts "hubo un error, el error es ----> #{e}" #Despuse de mostrar este puts, Ruby va a continuar hacia abajo
end
```

Para realizar acciones distintas para distinos tipos de errores
```ruby
begin
    #AQUI VA UNA EXPRESSION QUE VA A TIRAR UN ERROR 
rescue TypeError => e 
    puts "hubo un error TypeError, el error es ----> #{e}" 
rescue NoMethodError => e 
    puts "hubo un error NoMethodError, el error es ----> #{e}" 
rescue NameError => e 
    puts "hubo un error NameError, el error es ----> #{e}" 
end
```
