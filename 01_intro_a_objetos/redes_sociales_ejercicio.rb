class Persona

    attr_accessor :nombre, :edad, :redes_sociales

    def initialize(nombre, edad, redes_sociales)
        @nombre = nombre
        @edad = edad
        @redes_sociales = redes_sociales
    end
end

class RedSocial
    attr_accessor :tipo, :nombre_usuario
    
    def initialize(tipo,nombre_usuario)
        @tipo=tipo
        @nombre_usuario = nombre_usuario
    end
end

r1 = RedSocial.new('twitter','@juanchein')
r2 = RedSocial.new('facebook','Juan Valdez')
#puts "#{r2.tipo} #{r2.nombre_usuario}"

juanchito = Persona.new('Juan Pablo Valdes',20,[r1,r2])
puts juanchito.redes_sociales[0].tipo
r1.tipo = 'LinkedIn'
puts juanchito.redes_sociales[0].tipo