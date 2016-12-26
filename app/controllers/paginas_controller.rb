class PaginasController < ApplicationController
  before_action :set_pagina, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @paginas = Pagina.all
  end

  def show
  end

  def new
    @pagina = current_user.paginas.build
  end

  def edit
  end

  def create
    @pagina = current_user.paginas.build(pagina_params)

    respond_to do |format|
      if @pagina.save
        format.html { redirect_to @pagina, notice: 'Pagina criada com sucesso.' }
        format.json { render :show, status: :created, location: @pagina }
      else
        format.html { render :new }
        format.json { render json: @pagina.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pagina.update(pagina_params)
        format.html { redirect_to @pagina, notice: 'Pagina alterada com sucesso.' }
        format.json { render :show, status: :ok, location: @pagina }
      else
        format.html { render :edit }
        format.json { render json: @pagina.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pagina.destroy
    respond_to do |format|
      format.html { redirect_to paginas_url, notice: 'Pagina apagada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

    def set_pagina
      @pagina = Pagina.find(params[:id])
    end


    def pagina_params
      params.require(:pagina).permit(:name)
    end
end
