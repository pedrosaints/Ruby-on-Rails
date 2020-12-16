def da_boas_vindas
  puts "/****************/"
  puts "/ Jogo Foge Foge */"
  puts "/****************/"
  puts "Qual é o seu nome?"
  nome = gets.strip
  puts "\n\n\n\n\n\n"
  puts "Começaremos o jogo para você, #{nome}"
  nome
end

def nao_quer_jogar?
  puts "Deseja jogar novamente? (S/N)"
  quero_jogar = gets.strip
  quero_jogar.upcase == "N"
end

def avisa_pontos_totais pontos_totais
  puts "Você possui #{pontos_totais} pontos."
end
def avisa_pontos_ate_agora pontos_ate_agora
  puts "Você ganhou #{pontos_ate_agora} pontos."
end

def desenha_mapa mapa
  puts mapa
end

def pede_movimento
  puts "Para onde desenha ir?"
  movimento = gets.strip.upcase
  movimento
end

def game_over
  puts "\n\n\n"
  puts "Game Over"
end