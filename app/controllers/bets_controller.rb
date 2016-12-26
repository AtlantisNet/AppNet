class BetsController < ApplicationController
  before_action :set_bet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @bets = Bet.all
  end

  def show
  end

  def new
    @pagina = Pagina.find params[:pagina_id]
    @bet = @pagina.bets.build
  end

  def edit
  end

  def create
    @pagina = Pagina.find params[:pagina_id]
    @bet = @pagina.bets.build(bet_params)
    @bet.user_id = current_user.id

    respond_to do |format|
      if @bet.save
        format.html { redirect_to [@pagina, @bet], notice: 'Aposta criada.' }
        format.json { render :show, status: :created, location: [@pagina, @bet] }
      else
        format.html { render :new }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bet.update(bet_params)
        format.html { redirect_to [@pagina, @bet], notice: 'Aposta atualizada.' }
        format.json { render :show, status: :ok, location: [@pagina, @bet] }
      else
        format.html { render :edit }
        format.json { render json: @bet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bet.destroy
    respond_to do |format|
      format.html { redirect_to bets_url, notice: 'Aposta apagada.' }
      format.json { head :no_content }
    end
  end

  private

    def set_bet
      @bet = Bet.find(params[:id])
    end


    def bet_params
      params.require(:bet).permit(:pagina_id, :time1, :time2, :valor)
    end
end
