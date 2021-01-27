class Persona

    #def set_nombre(nombre) #Ruby acepta esta sintaxis que es la misma que en la mayoria de los otros lenguajes.
#    def nombre=(nombre) #setter. Esta es la sintaxis bonita de ruby que hace lo mismo que la linea de arriba
#        @nombre = nombre
#    end

    #def get_nombre #getter. Ruby acepta esta sintaxis que es la misma que en la mayoria de los otros lenguajes.
#    def nombre #getter. Esta es la sintaxis bonita de ruby que hace lo mismo que la linea de arriba
#        @nombre
#    end

#    def edad=(edad) #setter.
#        @edad = edad
#    end


#    def edad #getter
#        @edad
#    end

    #en la mayoria de los lenguajes, hay que crear TODOS los setters y TODOS los getters para cada atributo. Pero Ruby tiene lo que se llama metaprogramacion (codigo que genera codigo) para ayudar con esto
        
    #Usando attr para crear los setter y getters
    #attr_write :nomre, :edad
    #attr_reader :nombre, :edad

    #Usando attr nuevamente y mas resumidamente para hacer lo mismo que lo anterior
    attr_accessor :nombre, :edad

    def saludar
        puts 'holaaaaa'
    end
end

#coty = Persona.new

class Perro

    def ladrar
        puts('guau guau!')
    end
end

#cuando ponemos "@" hacemos que algo sea una variable de instancia. Esto hace que cualquier otro metodo de una instancia, pueda acceder a esa variable
class Vehiculo

    def encender
        @estado = 'encendido'
    end

    def apagar
        @estado = 'apagado'
    end

    def estado
        @estado
    end

end

class Empresa

    # def nombre
    #     @nombre
    # end

    # def direccion
    #     @direccion
    # end

    # def direccion=(direccion)
    #     @direccion = direccion
    # end

    #simplificando lo de arriba
    attr_write :direccion
    attr_reader :nombre, :direccion


end