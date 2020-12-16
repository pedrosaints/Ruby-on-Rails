require_relative 'livro'
require_relative 'estoque'
require_relative 'revista'
require_relative 'ebook'

def mais_barato_que(estoque, valor)
  estoque.select do |livro|
    livro.preco <= valor
  end
end

def livro_para_newsletter(livro)
  if livro.ano_lancamento < 1999
    puts "Newsletter/Liquidacao"
    puts livro.titulo
    puts livro.preco
  end
end

algoritmos = Livro.new("Algoritmos", 100, 1998, true, "editora", true )
# livro_para_newsletter algoritmos
arquitetura = Livro.new("Introdução À Arquitetura e Design de Software", 70, 2011, true, "editora", false)
programmer = Livro.new("The Pragmatic Programmer", 100, 1999, true, "editora", false)
ruby = Livro.new("Programming Ruby", 100, 2004, true, "editora", false)
revistona = Revista.new("Revista de Ruby", 10, 2012, true, "Revistas", 3)
online_arquitetura = Ebook.new("Introdução a Arquitetura e Design de Software", 50, 2012, "editora")


estoque = Estoque.new
estoque.adiciona  algoritmos
puts estoque.maximo_necessario # imprimir 1
estoque.adiciona  arquitetura
puts estoque.maximo_necessario # imprimir 2
estoque << programmer
puts estoque.maximo_necessario # imprimir 3
estoque << ruby
# estoque.adiciona nil #
puts estoque.maximo_necessario # imprimir 4

estoque << arquitetura << ruby << ruby << revistona << revistona << online_arquitetura

puts "\n* Livros em estoque (#{estoque.total}):\n\n"
estoque.exporta_csv
puts

estoque.vende ruby
estoque.vende ruby
estoque.vende ruby
estoque.vende algoritmos
estoque.vende algoritmos
estoque.vende revistona
estoque.vende online_arquitetura

puts "\n* Livros que mais vendeu por título: " + estoque.livro_que_mais_vendeu_por_titulo.titulo + "\n\n"
puts "\n* Revista que mais vendeu por título: " + estoque.revista_que_mais_vendeu_por_titulo.titulo + "\n\n"
puts "\n* Ebook que mais vendeu por título: " + estoque.ebook_que_mais_vendeu_por_titulo.titulo + "\n\n"
# puts estoque.respond_to?(:ebook_que_mais_vendeu_por_titulo)


puts "\n* Livros em estoque (#{estoque.total}):\n\n"
estoque.exporta_csv
puts

# valor = 80.00
# puts "\n* Livros mais baratos que #{valor}:\n\n"
# baratos = estoque.mais_barato_que valor
# baratos.each do |livro|
#   puts livro.titulo
# end
# puts