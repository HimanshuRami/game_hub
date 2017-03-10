class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    # to show only login user's games
    # Option-1
    # @games = current_user.games
    # Option -2 
    # @games = Game.where(:user-id => current_user.id)
    # ------------------------------
    # all games..
    @games = Game.all 
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
      params.require(:game).permit(:name, :price, :category_id, :user_id)
    end
end