class PlayersController < ApplicationController
  # GET /players
  # GET /players.json
  def index
    @players = Player.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @players }
    end
  end

  # GET /winner/1
  def winner
    @winner = Player.find(params[:winner_id])
    respond_to do |format|
      format.html #winner.html.erb
    end
  end

  # GET /select
  def select
    @players = Player.all

    respond_to do |format|
      format.html # select.html.erb
    end
  end

  # GET /game/1/2
  def game 
    @player_one = Player.find(params[:player_one_id])
    @player_two = Player.find(params[:player_two_id])

    respond_to do |format|
      format.html # game.html.erb
    end
  end

  # POST /end_game
  def end_game
    @player1 = Player.find(params[:player_one_id])
    @player2 = Player.find(params[:player_two_id])

    def get_winner_games
      games = Array.new
      iter = 1
      if params[:player_one_score1] != ""
      @player1.total_games += 1
      @player1.current_score = 0
      @player2.total_games += 1
      @player2.current_score = 0
	if params[:player_one_score1].to_i > params[:player_two_score1].to_i
        @player1.cumulative_wins += 1
	games.push(@player1)
	else
        @player2.cumulative_wins += 1
	games.push(@player2)
	end
	 @game=Game.new
	 @game.players1 = params[:player_one_id]
	 @game.player2 = params[:player_two_id]
	 @game.score1 = params[:player_one_score1]
	 @game.score2 = params[:player_two_score1]
	 @game.save
      end
      if params[:player_one_score2] != ""
      @player1.total_games += 1
      @player1.current_score = 0
      @player2.total_games += 1
      @player2.current_score = 0
	if params[:player_one_score2].to_i > params[:player_two_score2].to_i
        @player1.cumulative_wins += 1
	games.push(@player1)
	else
        @player2.cumulative_wins += 1
	games.push(@player2)
	end
	 @game=Game.new
	 @game.players1 = params[:player_one_id]
	 @game.player2 = params[:player_two_id]
	 @game.score1 = params[:player_one_score2]
	 @game.score2 = params[:player_two_score2]
	 @game.save
      end
      if params[:player_one_score3] != ""
      @player1.total_games += 1
      @player1.current_score = 0
      @player2.total_games += 1
      @player2.current_score = 0
	if params[:player_one_score3].to_i > params[:player_two_score3].to_i
        @player1.cumulative_wins += 1
	games.push(@player1)
	else
        @player2.cumulative_wins += 1
	games.push(@player2)
	end
	 @game=Game.new
	 @game.players1 = params[:player_one_id]
	 @game.player2 = params[:player_two_id]
	 @game.score1 = params[:player_one_score3]
	 @game.score2 = params[:player_two_score3]
	 @game.save
      end
      if games.count(@player1) > games.count(@player2)
	return @player1
      else 
	return @player2
      end
    end


     get_winner_games	 
    if @player1.save && @player2.save 
		 redirect_to "/players"     
		#respond_to do |format|
        #format.html { redirect_to "/winner/#{@winner}", notice: "#{Player.find(@winner).name} IS THE WINNER!" }
      #end
    end 

  end
    

  # GET /players/1
  # GET /players/1.json
  def show
    @player = Player.find(params[:id])
	 @game = Game.all.select { |t| t.players1 == params[:id] || t.player2 == params[:id] }
	 @game = @game.sort {|a,b| b<=>a}
	 @game = @game.take(13)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/new
  # GET /players/new.json
  def new
    @player = Player.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player }
    end
  end

  # GET /players/1/edit
  def edit
    @player = Player.find(params[:id])
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(params[:player])

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render json: @player, status: :created, location: @player }
      else
        format.html { render action: "new" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /players/1
  # PUT /players/1.json
  def update
    @player = Player.find(params[:id])

    respond_to do |format|
      if @player.update_attributes(params[:player])
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to players_url }
      format.json { head :no_content }
    end
  end

end
