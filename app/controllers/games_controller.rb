class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    # to show only login user's games
    # Option-1
    #@games = current_user.games
    # Option -2 
    # @games = Game.where(:user_id => current_user.id)
    @games = Game.all
    # ------------------------------
    # all games..
    @categories = Category.all
    if params[:c_id].present?
      @games = Game.where(:category_id => params[:c_id])
    else 
      @games = Game.all
    end 
    respond_with(@games)
  end

  def show
    respond_with(@game)
  end

  def new
    @game = Game.new
    respond_with(@game)
  end

  def edit
  end

  def create
    @game = Game.new(game_params)
    @game.save
    respond_with(@game)
  end

  def update
    @game.update(game_params)
    respond_with(@game)
  end

  def destroy
    @game.destroy
    respond_with(@game)
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:name, :price, :category_id, :user_id, :image)
    end
end
