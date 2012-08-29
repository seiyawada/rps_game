def rps_game(players)
  rockPlayers = []; scissorsPlayers = []; paperPlayers = [];
  turn = 0
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
  
  if (rockPlayers.size == 0 && scissorsPlayers.size == 0 && paperPlayers.size == 0) #draw end
    return [-1, -1]
  elsif (rockPlayers.size == 1 && paperPlayers.size == 0) #rock wins scissors
    return [turn,rockPlayers[0]]
  elsif (scissorsPlayers.size == 1 && rockPlayers.size == 0)  #scissors wins paper
    return [turn,scissorsPlayers[0]]
  elsif (paperPlayers.size == 1 && scissorsPlayers.size == 0) #paper win rock
    return [turn,paperPlayers[0]]
  end
end