

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
