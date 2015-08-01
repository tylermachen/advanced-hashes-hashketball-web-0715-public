require 'pry'

def game_hash
  h = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["black", "white"],
      players: [
        { player_name: "Alan Anderson", number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1 },
        { player_name: "Reggie Evans", number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7 },
        { player_name: "Brook Lopez", number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15 },
        { player_name: "Mason Plumlee", number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5 },
        { player_name: "Jason Terry", number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1 }
      ]
    },  
    away: {
      team_name: "Charlotte Hornets",
      colors: ["turquoise", "purple"],
      players: [
        { player_name: "Jeff Adrien", number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2 },
        { player_name: "Bismak Biyombo", number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10 },
        { player_name: "DeSagna Diop", number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5 },
        { player_name: "Ben Gordon", number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0 },
        { player_name: "Brendan Haywood", number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12 }
      ]
    }     
  }
end

def num_points_scored(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute, data|
      return attribute[:points] if attribute[:player_name] == player
    end
  end
end

def shoe_size(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute, data|
      return attribute[:shoe] if attribute[:player_name] == player
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    return team_data[:colors].map { |c| c.capitalize } if team_data[:team_name] == team
  end
end

def team_names
  game_hash.map { |location, team_data| team_data[:team_name] }
end

def player_numbers(team)
  n = []
  game_hash.each do |location, team_data|
    team_data[:players].map { |attribute| n << attribute[:number] } if team_data[:team_name] == team
  end
  n
end

def player_stats(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute, data|
      if attribute[:player_name] == player
        attribute.delete(:player_name)
        return attribute
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute, data|
      biggest_shoe, rebounds = attribute[:shoe], attribute[:rebounds] if attribute[:shoe] > biggest_shoe
    end
  end
  rebounds
end