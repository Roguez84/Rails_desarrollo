# class X
#     def metodo_complejo
#         puts "durante"
#     end
# end

# class Y < X
#     def metodo_complejo
#         puts "antes"
#         super()
#         puts "después"
#     end
# end
# Y.new.metodo_complejo

class Abuelo
end
class Padre < Abuelo
end
class Hijo < Padre
end
print Hijo.ancestors # => [Hijo, Padre, Abuelo, Object, Kernel, BasicObject]
