require 'test/unit'
require_relative 'rps_game'

class RPSTestCase < Test::Unit::TestCase
  def test_simple_win_lose
    # :rock loses :paper
    turn_person = rps_game([[:rock], [:paper]])
    assert_equal(turn_person, [0, 1])
    
    # :rock wins :scissors
    turn_person = rps_game([[:rock], [:scissors]])
    assert_equal(turn_person, [0, 0])
    
    # :scissors wins :paper
    turn_person = rps_game([[:paper], [:scissors]])
    assert_equal(turn_person, [0, 1])
  end
  
  def test_missing_hands
    # player 1 does not show a hand at 2nd turn, so loses.
    data = [[:rock, :paper], [:rock]]
    turn, person = rps_game(data)
    assert_equal(turn, 1)
    assert_equal(person, 0)
  end
  
  def test_draw
    turn_person = rps_game([[:rock], [:rock]])
    assert_equal(turn_person, [-1, -1])
    
    turn_person = rps_game([[:paper], [:paper]])
    assert_equal(turn_person, [-1, -1])
    
    turn_person = rps_game([[:scissors], [:scissors]])
    assert_equal(turn_person, [-1, -1])
  end
  
  def test_no_player
    turn, person = rps_game([])
    assert_equal(turn,-1)
    assert_equal(person,-1)
  end
  
  def test_complex_win_lose
    #Turn 0, paperPlayer (player 2) win other rockPlayers
    turn_person = rps_game([[:rock], [:rock], [:paper]])
    assert_equal(turn_person, [0, 2])
    
    #Turn 1, player 0 win other players
    turn_person = rps_game([[:rock, :rock], [:scissors, :scissors], [:paper, :scissors]])
    assert_equal(turn_person, [1, 0])

    #Trun 2, player 0 win other players
    turn_person = rps_game([[:rock, :rock, :rock], [:scissors, :scissors], [:paper, :paper]])
    assert_equal(turn_person, [2, 0])
    
    #Trun 1, player 0 lose other players
    #Turn 2, player 1 win other players
    turn_person = rps_game([[:rock, :rock, :rock], [:scissors, :paper, :rock], [:paper, :paper, :scissors], [:paper, :paper, :scissors]])
    assert_equal(turn_person, [2, 1])
  end
  
end