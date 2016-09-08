  class GuardarPreguntas
    
    def buildHash
      File.open("questions.txt", 'r') do |f1|

        unHash = Hash.new
        while linea = f1.gets
          
          if linea.include?("(Definition)") == true then
            def1 = linea.chomp
            def2 = def1.chomp("(Definition)").strip
          end

          if linea.include?("(answer)") == true then
            ans = linea.chomp
            ans2 = ans.chomp("(answer)").strip

            unHash.has_key?(def2) == false ? unHash[def2] = ans2 : ""
          end

        end 
        unHash        
      end  
    end 
  end

guardar = GuardarPreguntas.new



class Juego
  
  def initialize(guardar)
    @guardar = guardar
  end

  def jugar
    
    @hash = @guardar.buildHash

    puts "-------------------------------------------------------------
    Bienvenido a reto 5, Para jugar, solo ingresa la respuesta 
    correcta para cada una de las preguntas, Listo ? Vamos!"

    puts "-------------------------------------------------------------
    Presiona enter para comenzar"

    comenzar = gets
    hashLen = @hash.length
    i = 0
    while (i < hashLen )
      
        puts @hash.keys[i]
        print "--> "
        respuesta = gets.chomp.strip

        if respuesta == @hash.values[i] then
          puts "Correcto !!"
          puts
          i += 1
        else
          puts "Incorrecto !!"
          puts
        end

        if i == hashLen then
          puts "Has ganado !! 
          El juego ha terminado !!"
        end
    end
  end
end

juego = Juego.new(guardar)
puts juego.jugar
