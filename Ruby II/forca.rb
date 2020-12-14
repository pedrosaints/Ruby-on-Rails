def da_boas_vindas
  puts "Qual é o seu nome?"
  nome = gets.strip
  puts "\n\n\n\n\n\n"
  puts "Começaremos o jogo para você, #{nome}"
  nome
end

def escolhe_palavra_secreta
  puts "Escolhendo palavra secreta..."
  palavra_secreta = "programador"
  puts "Palavra secreta com #{palavra_secreta.size} letras... Boa sorte!"
  palavra_secreta
end

def pede_um_chute(chutes, erros, limite_de_tentativas)
  puts "\n"
  puts "Tentativa #{erros + 1} de #{limite_de_tentativas}"
  puts "Chutes até agora: #{chutes}"
  puts "Entre com uma letra ou uma palavra"
  chute = gets.strip
  puts "Será que acertou? Você chutou #{chute}"
  chute
end

def ganhou
  puts
  puts "             OOOOOOOOOOO               "
  puts "         OOOOOOOOOOOOOOOOOOO           "
  puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
  puts "    OOOOOO      OOOOO      OOOOOO      "
  puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
  puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
  puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
  puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
  puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
  puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
  puts "         OOOOOO         OOOOOO         "
  puts "             OOOOOOOOOOOO              "
  puts
  puts "               Acertou!                "
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
  else
    puts "Letra não encontrada!"
  end
end

def nao_quer_jogar?
  puts "Deseja jogar novamente? (S/N)"
  quero_jogar = gets.strip
  quero_jogar.upcase == "N"
end

def joga(nome)
  palavra_secreta = escolhe_palavra_secreta

  limite_de_tentativas = 5
  chutes = []
  pontos_ate_agora = 0
  erros = 0


  while erros < limite_de_tentativas
    #jogo
    chute = pede_um_chute chutes, erros, limite_de_tentativas
    if chutes.include? chute
      puts "Você já deu esse chute"
      next
    end
    chutes << chute

    chutou_uma_letra = chute.size == 1
    if chutou_uma_letra
      verifica_letra palavra_secreta, chute[0]
    else
      if verifica_se_acertou palavra_secreta, chute
        pontos_ate_agora += 100
        break
      end
      pontos_ate_agora -= 30
      errou
    end
    erros += 1;
  end

  puts "Você ganhou #{pontos_ate_agora} pontos."
end

nome = da_boas_vindas


loop do
  joga nome
  break if nao_quer_jogar?
end