class ProdutosController < ApplicationController

  def index
    # @produtos = Produto.order :nome
    @produtos = Produto.order(nome: :asc).limit 5
    @produtos_com_desconto = Produto.order(:preco).limit 1
  end

  def create
    valores = params.require(:produto).permit(:nome,
                                              :descricao, :preco, :quantidade)
    @produto = Produto.new valores
    if @produto.save
      flash[:notice] = "Produto salvo com sucesso!"
      redirect_to root_url
    else
      render :new
    end
  end

  def new
    @produto = Produto.new
  end

  def destroy
    id = params[:id]
    Produto.destroy id
    redirect_to root_url
  end

  def busca
    @nome = params[:nome]
    @produtos = Produto.where "nome like ?",  "%#{@nome}%"
  end

end
