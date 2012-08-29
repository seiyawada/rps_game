def rps_game(players)
  rockPlayers = []; scissorsPlayers = []; paperPlayers = [];

  players.size.times do |i|
    hand = players[i].shift
    if hand == :rock
      rockPlayers.push i
    elsif hand == :scissors
      scissorsPlayers.push i
    elsif hand == :paper
      paperPlayers.push i
    end
  end
  
  if rockPlayers.size == 0 && scissorsPlayers.size == 0 && paperPlayers.size == 0
    return [-1, -1]
  end
end