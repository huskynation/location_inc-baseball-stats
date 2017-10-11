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

  braves.each do |name|
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

marlins.each do |name|
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
                  
                  
expos.each do |name|
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
                  
                  
mets.each do |name|
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


phillies.each do |name|
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
                  
                  
cubs.each do |name|
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
                  
                  
reds.each do |name|
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
                  
                  
reds.each do |name|
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
                  
                  
astros.each do |name|
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
                  
                  
brewers.each do |name|
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
                  
                  
pirates.each do |name|
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
                  
                  
cardinals.each do |name|
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
                  
                  
diamondbacks.each do |name|
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
                  
                  
rockies.each do |name|
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
                  
                  
dodgers.each do |name|
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
                  
                  
padres.each do |name|
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
                  
                  
giants.each do |name|
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
                  
                  
orioles.each do |name|
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
                  
                  
                  
redsox.each do |name|
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
                  
                  
yankees.each do |name|
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
                  
                  
devil_rays.each do |name|
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
                  
                  
blue_jays.each do |name|
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
                  
                  
whitesox.each do |name|
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
                  
                  
royals.each do |name|
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
                  
                  
tigers.each do |name|
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
                  
                  
indians.each do |name|
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
                  
                  
twins.each do |name|
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
                  
                  
angels.each do |name|
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
                  
                  
athletics.each do |name|
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
                  
                  
mariners.each do |name|
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
                  
                  
rangers.each do |name|
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