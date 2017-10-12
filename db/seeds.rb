require 'json'
require 'ostruct'

[Player].each(&:destroy_all)

file = File.read("#{Rails.root}/db/1998_stats.json")
data_hash = JSON.parse(file).with_indifferent_access

# TURN HASH INTO VERSATILE STRUCT OBJECTS /// NO NEED TO DEFINE CLASSES\
# data_hash_struct = JSON.parse(file, object_class: OpenStruct)
# players = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][0]['TEAM'].count

Player.destroy_all

east = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][0]['DIVISION_NAME']
central = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][1]['DIVISION_NAME']
west = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][2]['DIVISION_NAME']
division_count = data_hash['SEASON']['LEAGUE'][0]['DIVISION'].count


# DIVISIONS
east_teams = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][0]['TEAM']
central_teams = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][1]['TEAM']
west_teams = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][2]['TEAM']

#####################ALL TEAMS ###################################
  braves  = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][0]['TEAM'][0]['PLAYER']
  marlins  = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][0]['TEAM'][1]['PLAYER']
  expos  = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][0]['TEAM'][2]['PLAYER']
  mets  = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][0]['TEAM'][3]['PLAYER']
  phillies  = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][0]['TEAM'][4]['PLAYER']
  
  cubs  = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][1]['TEAM'][0]['PLAYER']
  reds  = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][1]['TEAM'][1]['PLAYER']
  astros  = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][1]['TEAM'][2]['PLAYER']
  brewers  = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][1]['TEAM'][3]['PLAYER']
  pirates  = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][1]['TEAM'][4]['PLAYER']
  cardinals  = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][1]['TEAM'][5]['PLAYER']
  
  diamondbacks  = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][2]['TEAM'][0]['PLAYER']
  rockies  = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][2]['TEAM'][1]['PLAYER']
  dodgers  = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][2]['TEAM'][2]['PLAYER']
  padres  = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][2]['TEAM'][3]['PLAYER']
  giants  = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][2]['TEAM'][4]['PLAYER']
  
  orioles  = data_hash['SEASON']['LEAGUE'][1]['DIVISION'][0]['TEAM'][0]['PLAYER']
  redsox  = data_hash['SEASON']['LEAGUE'][1]['DIVISION'][0]['TEAM'][1]['PLAYER']
  yankees  = data_hash['SEASON']['LEAGUE'][1]['DIVISION'][0]['TEAM'][2]['PLAYER']
  devil_rays  = data_hash['SEASON']['LEAGUE'][1]['DIVISION'][0]['TEAM'][3]['PLAYER']
  blue_jays  = data_hash['SEASON']['LEAGUE'][1]['DIVISION'][0]['TEAM'][4]['PLAYER']
  
  whitesox  = data_hash['SEASON']['LEAGUE'][1]['DIVISION'][1]['TEAM'][0]['PLAYER']
  royals  = data_hash['SEASON']['LEAGUE'][1]['DIVISION'][1]['TEAM'][1]['PLAYER']
  tigers  = data_hash['SEASON']['LEAGUE'][1]['DIVISION'][1]['TEAM'][2]['PLAYER']
  indians  = data_hash['SEASON']['LEAGUE'][1]['DIVISION'][1]['TEAM'][3]['PLAYER']
  twins  = data_hash['SEASON']['LEAGUE'][1]['DIVISION'][1]['TEAM'][4]['PLAYER']
  
  angels  = data_hash['SEASON']['LEAGUE'][1]['DIVISION'][2]['TEAM'][0]['PLAYER']
  athletics  = data_hash['SEASON']['LEAGUE'][1]['DIVISION'][2]['TEAM'][1]['PLAYER']
  mariners  = data_hash['SEASON']['LEAGUE'][1]['DIVISION'][2]['TEAM'][2]['PLAYER']
  rangers  = data_hash['SEASON']['LEAGUE'][1]['DIVISION'][2]['TEAM'][3]['PLAYER']
  
  all_players = [braves, marlins, expos, mets, phillies, cubs, reds, astros, brewers, pirates, cardinals,
                    diamondbacks, rockies, dodgers, padres, giants, orioles, redsox, yankees, devil_rays, blue_jays, 
                    whitesox, royals, tigers, indians, twins, angels, athletics, mariners, rangers]
                    
  all_players.each do |players_per_team|
    players_per_team.each do |player|
      Player.create! do |new_player|
        new_player.first = player['GIVEN_NAME']
        new_player.last = player['SURNAME']
        new_player.position  =  player['POSITION']
        new_player.hits  =  player['HITS']
        new_player.bats  =  player['AT_BATS']
        new_player.doubles  =  player['DOUBLES']
        new_player.triples  =  player['TRIPLES']
        new_player.walks  =  player['WALKS']
        new_player.hbp  =  player['HIT_BY_PITCH']
        new_player.sh  =  player['SACRIFICE_HITS']
        new_player.sf  =  player['SACRIFICE_FLIES']
        new_player.avg  =  nil
        new_player.hr  =  player['HOME_RUNS']
        new_player.rbi  =  player['RBI']
        new_player.sb  =  player['STEALS']
        new_player.ops  =  player['']
        new_player.runs  =  player['']
        new_player.obp = player['']
      end
    end
  end

  
# TEAMS LOOP FUNCTION

# east_teams.each do |name|
#     puts name[:'TEAM_NAME']
# end

# central_teams.each do |name|
#     puts name[:'TEAM_NAME']
# end

# west_teams.each do |name|
#     puts name[:'TEAM_NAME']
# end
