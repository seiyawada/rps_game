def rps_game(players, turn = 0)
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
  
  if (rockPlayers.size == 0 && scissorsPlayers.size == 0 && paperPlayers.size == 0) #draw end
    return [-1, -1]
  elsif (rockPlayers.size == 1 && paperPlayers.size == 0) #rock wins scissors
    return [turn,rockPlayers[0]]
  elsif (scissorsPlayers.size == 1 && rockPlayers.size == 0)  #scissors wins paper
    return [turn,scissorsPlayers[0]]
  elsif (paperPlayers.size == 1 && scissorsPlayers.size == 0) #paper win rock
    return [turn,paperPlayers[0]]  
  elsif (paperPlayers.size == 0) #rock wins scissors, next game
    scissorsPlayers.each do |i|
      players[i] = []
    end
    return rps_game(players, turn = turn + 1)
  elsif (rockPlayers.size == 0)  #scissors wins paper, next game
    paperPlayers.each do |i|
      players[i] = []
    end
    return rps_game(players, turn = turn + 1)
  elsif (scissorsPlayers.size == 0) #paper win rock, next game
    rockPlayers.each do |i|
      players[i] = []
    end
    return rps_game(players, turn = turn + 1)
  else 
    return rps_game(players, turn = turn + 1) #draw, next game
  end
end