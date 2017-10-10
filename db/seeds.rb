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


# PLAYERS
braves_players = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][0]['TEAM'][0]['PLAYER']
  braves_players.each do |name|
      first = name[:'GIVEN_NAME']
      last = name[:'SURNAME']
      position = name[:'POSITION']
      hits = name[:'HITS']
      at_bats = name[:'AT_BATS']
      doubles = name[:'DOUBLES']
      triples = name[:'TRIPLES']
      walks = name[:'WALKS']
      hbp = name[:'HIT_BY_PITCH']
      sh = name[:'SACRIFICE_HITS']
      sf = name[:'SACRIFICE_FLIES']
      hr = name[:'HOME_RUNS']
      rbi = name[:'RBI']
      sb = name[:'STEALS']
      runs = name[:'RUNS']
      ops = name[:'']
      obp = name[:'']
    
    Player.create!(  first: first,
                    last: last,
                    position: position,
                    hits: hits,
                    bats: at_bats,
                    doubles: doubles,
                    triples: triples,
                    walks: walks,
                    hbp: hbp,
                    sh: sh,
                    sf: sf,
                    avg: nil,
                    hr: hr,
                    rbi: rbi,
                    sb: sb,
                    ops: ops,
                    runs: runs,
                    obp: obp
                    )
  end

florida_players = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][0]['TEAM'][1]['PLAYER']
florida_players.each do |name|
      first = name[:'GIVEN_NAME']
      last = name[:'SURNAME']
      position = name[:'POSITION']
      hits = name[:'HITS']
      at_bats = name[:'AT_BATS']
      doubles = name[:'DOUBLES']
      triples = name[:'TRIPLES']
      walks = name[:'WALKS']
      hbp = name[:'HIT_BY_PITCH']
      sh = name[:'SACRIFICE_HITS']
      sf = name[:'SACRIFICE_FLIES']
      hr = name[:'HOME_RUNS']
      rbi = name[:'RBI']
      sb = name[:'STEALS']
      runs = name[:'RUNS']
      ops = name[:'']
      obp = name[:'']
      
    Player.create(  first: first,
                    last: last,
                    position: position,
                    hits: hits,
                    bats: at_bats,
                    doubles: doubles,
                    triples: triples,
                    walks: walks,
                    hbp: hbp,
                    sh: sh,
                    sf: sf,
                    avg: nil,
                    hr: hr,
                    rbi: rbi,
                    sb: sb,
                    ops: ops,
                    runs: runs,
                    obp: obp
                    )
                  end
