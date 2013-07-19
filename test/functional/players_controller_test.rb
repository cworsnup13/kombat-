require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  setup do
    @player = players(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post :create, player: { avatar: @player.avatar, cumulative_wins: @player.cumulative_wins, current_score: @player.current_score, email: @player.email, name: @player.name, pin: @player.pin, skill: @player.skill, total_games: @player.total_games }
    end

    assert_redirected_to player_path(assigns(:player))
  end

  test "should show player" do
    get :show, id: @player
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player
    assert_response :success
  end

  test "should update player" do
    put :update, id: @player, player: { avatar: @player.avatar, cumulative_wins: @player.cumulative_wins, current_score: @player.current_score, email: @player.email, name: @player.name, pin: @player.pin, skill: @player.skill, total_games: @player.total_games }
    assert_redirected_to player_path(assigns(:player))
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete :destroy, id: @player
    end

    assert_redirected_to players_path
  end
end
