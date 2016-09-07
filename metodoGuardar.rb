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

c1 = Guardar.new
puts c1.buildHash


class Juego
  
  def jugar
    puts "-----------"
    
    
  end
end

c2 = Juego.new
puts c2.jugar

