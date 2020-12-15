require_relative 'ui'
require_relative 'rank'

def escolhe_palavra_secreta
  avisa_escolhendo_palavra_secreta

  texto = File.read("dicionario.txt")
  dicionario = texto.split "\n"
  num_escolhido = rand(dicionario.size)
  palavra_secreta = dicionario[num_escolhido].downcase

  avisa_palavra_secreta_escolhida palavra_secreta
  palavra_secreta
end

def escolhe_palavra_secreta_menor_custo_memoria
  #primeira linha do arquivo tem a quantidade de palavras
  avisa_escolhendo_palavra_secreta
  texto = File.new("dicionario.txt")
  qtd_palavra = texto.gets.to_i
  num_escolhido = rand(qtd_palavra)
  for i in 1...(num_escolhido-1)
    texto.gets
  end
  palavra_secreta = texto.gets.strip.downcase
  texto.close
  avisa_palavra_secreta_escolhida palavra_secreta
  palavra_secreta
end

def palavra_mascarada palavra_secreta, chutes
  mascara = ""
  for letra in palavra_secreta.chars
    if chutes.include? letra
      mascara << letra
    else
      mascara << "_"
    end
  end
  return mascara
end

def pede_um_chute_valido chutes, erros, limite_de_tentativas, mascara
  cabecalho_tentativas chutes, erros, limite_de_tentativas, mascara
  loop do
    chute = pede_um_chute
    if chutes.include? chute
      avisa_chute_efetuado chute
    else
      return chute
    end
  end
end

def joga(nome)
  palavra_secreta = escolhe_palavra_secreta

  limite_de_tentativas = 5
  chutes = []
  pontos_ate_agora = 0
  erros = 0


  while erros < limite_de_tentativas
    #jogo
    mascara = palavra_mascarada palavra_secreta, chutes
    chute = pede_um_chute_valido chutes, erros, limite_de_tentativas, mascara
    chutes << chute

    chutou_uma_letra = chute.size == 1
    if chutou_uma_letra
      erros += verifica_letra palavra_secreta, chute[0]
    else
      if verifica_se_acertou palavra_secreta, chute
        pontos_ate_agora += 100
        break
      end
      pontos_ate_agora -= 30
      errou
      erros += 1
    end
  end

  avisa_pontos_ate_agora pontos_ate_agora
  pontos_ate_agora
end

def jogo_da_forca
  nome = da_boas_vindas
  pontos_totais = 0
  avisa_campeao_atual le_rank

  loop do
    pontos_totais += joga nome
    avisa_pontos_totais pontos_totais
    if le_rank[1].to_i < pontos_totais
      salva_rank nome, pontos_totais
    end
    break if nao_quer_jogar?
  end
end