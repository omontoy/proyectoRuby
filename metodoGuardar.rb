  class Guardar
    
    def buildHash
      File.open("questions.txt", 'r') do |f1|

        unHash = Hash.new
        while linea = f1.gets
          
          if linea.include?("(Definition)") == true then
            def1 = linea
            def2 = def1.chomp(" (Definition)\n")
          end

          if linea.include?("(answer)") == true then
            ans = linea
            ans2 = ans.chomp(" (answer)\n")

            unHash.has_key?(def2) == false ? unHash[def2] = ans2 : ""
          end

        end #while
        unHash
        # puts unHash.keys
        # puts
        # puts unHash.values

      end  #File.open

    end #def

  end

guardar = Guardar.new
puts guardar.buildHash


class Juego
  
  def initialize(guardar)
    @guardar = guardar
  end

  def jugar
    puts "-----------"
    @hash = @guardar.buildHash

    i = 0
    while (i < 4)
      
        puts @hash.keys[i]
        respuesta = gets.chomp

        if respuesta == @hash.values[i] then
          puts "Correcto !!"
          puts
          i = i
        else
          puts "Incorrecto !!"
          puts
          i = i - 1
        end
    
    i += 1
    end


    # i = 0   
    # while (i != 2)
    #   for i in 0..@hash.length-1
    #     puts @hash.keys[i]
    #     respuesta = gets.chomp

    #     puts respuesta == @hash.values[i]
    #   end
    #   i += 1
    # end



  end
end

c2 = Juego.new(guardar)
puts c2.jugar

