def da_boas_vindas
  puts "/****************/"
  puts "/ Jogo de Forca */"
  puts "/****************/"
  puts "Qual é o seu nome?"
  nome = gets.strip
  puts "\n\n\n\n\n\n"
  puts "Começaremos o jogo para você, #{nome}"
  nome
end

def desenha_forca(erros)
  cabeca = "   "
  corpo = " "
  pernas = "   "
  bracos = "   "
  if erros >= 1
    cabeca = "(_)"
  end
  if erros >= 2
    bracos = " | "
    corpo = "|"
  end
  if erros >= 3
    bracos = "\\|/"
  end
  if erros >= 4
    pernas = "/ \\"
  end

  puts "  _______       "
  puts " |/      |      "
  puts " |      #{cabeca}  "
  puts " |      #{bracos}  "
  puts " |       #{corpo}  "
  puts " |      #{pernas}  "
  puts " |              "
  puts "_|___           "
  puts

end

def avisa_escolhendo_palavra_secreta
  puts "Escolhendo palavra secreta..."
end
def avisa_palavra_secreta_escolhida palavra_secreta
  puts "Palavra secreta com #{palavra_secreta.size} letras... Boa sorte!"
end
def avisa_campeao_atual dados
  puts "Nosso campeão atual é #{dados[0]} com #{dados[1]}."
end

def cabecalho_tentativas (chutes,erros, limite_de_tentativas, mascara)
  puts "\n"
  desenha_forca erros
  puts "Palavra secreta é: #{mascara}"
  puts "Tentativa #{erros + 1} de #{limite_de_tentativas}"
  puts "Chutes até agora: #{chutes}"
end

def pede_um_chute
  puts "Entre com uma letra ou uma palavra"
  chute = gets.strip.downcase
  puts "Será que acertou? Você chutou #{chute}"
  chute
end

def ganhou
  puts "\nParabéns, você ganhou!"
  puts

  puts "       ___________      "
  puts "      '._==_==_=_.'     "
  puts "      .-\\:      /-.    "
  puts "     | (|:.     |) |    "
  puts "      '-|:.     |-'     "
  puts "        \\::.    /      "
  puts "         '::. .'        "
  puts "           ) (          "
  puts "         _.' '._        "
  puts "        '-------'       "
  puts
end
def errou
  puts
  puts "             OOOOOOOOOOO               "
  puts "         OOOOOOOOOOOOOOOOOOO           "
  puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
  puts "    OOOOOO      OOOOO      OOOOOO      "
  puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
  puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOOOOOOOOOOO          OOOOOOOOOOOOOO  "
  puts " OOOOOOOOO   OOOOOOOOOO   OOOOOOOOOO   "
  puts "   OOOOOO   OOOOOOOOOOOO   OOOOOOO     "
  puts "      OOOOOOOOOOOOOOOOOOOOOOOOO        "
  puts "         OOOOOOOOOOOOOOOOOOO           "
  puts "             OOOOOOOOOOOO              "
  puts
  puts "               Errou!                "
  puts
end

def verifica_se_acertou(palavra_secreta, chute)
  acertou = palavra_secreta == chute
  if acertou
    ganhou
    return true
  end
  false
end

def verifica_letra(palavra, letra)
  total_encontrado = palavra.count letra
  if total_encontrado > 0
    puts "Letra encontrada #{total_encontrado} vezes"
    return 0
  else
    puts "Letra não encontrada!"
    return 1
  end
end

def nao_quer_jogar?
  puts "Deseja jogar novamente? (S/N)"
  quero_jogar = gets.strip
  quero_jogar.upcase == "N"
end

def avisa_chute_efetuado chute
  puts "Você já chutou #{chute}"
end

def avisa_pontos_ate_agora pontos_ate_agora
  puts "Você ganhou #{pontos_ate_agora} pontos."
end

def avisa_pontos_totais pontos_totais
  puts "Você possui #{pontos_totais} pontos."
end
