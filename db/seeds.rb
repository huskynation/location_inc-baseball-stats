# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'json'
require 'ostruct'

file = File.read("#{Rails.root}/db/1998_stats.json")
data_hash = JSON.parse(file).with_indifferent_access
# data_hash_struct = JSON.parse(file, object_class: OpenStruct)
# players = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][0]['TEAM'].count
east = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][0]['DIVISION_NAME']
central = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][1]['DIVISION_NAME']
west = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][2]['DIVISION_NAME']
division_count = data_hash['SEASON']['LEAGUE'][0]['DIVISION'].count


# TEAMS
east_teams = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][0]['TEAM']
central_teams = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][1]['TEAM']
west_teams = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][2]['TEAM']

# puts east
# puts central
# puts west
# puts division_count

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
# braves_players.each do |name|
#     puts name[:'GIVEN_NAME']
#     puts name[:'SURNAME']
#     puts name[:'POSITION']
#     puts name[:'AT_BATS']
#     puts name[:'HITS']
#     puts name[:'RUNS']
#     puts name[:'STEALS']
#     puts "------------"
#     puts "            "
# end

braves_players.each do |name|
    first = name[:'GIVEN_NAME']
    last = name[:'SURNAME']
    position = name[:'POSITION']
    hits = name[:'HITS']
    at_bats = name[:'AT_BATS']
    avg = name[:'']
    hr = name[:'HOME_RUNS']
    rbi = name[:'RBI']
    sb = name[:'STEALS']
    ops = name[:'']
    Player.create(  first: first,
                    last: last,
                    position: position,
                    hits: hits,
                    bats: at_bats,
                    avg: avg,
                    hr: hr,
                    rbi: rbi,
                    sb: sb,
                    ops: ops
                    )
    # name[:'GIVEN_NAME'] = name
    # puts name
end





# puts east_teams
# players = data_hash['SEASON']['LEAGUE'][0]['DIVISION'][0]['TEAM'][0]



# data_hash.each do |key, value|
#     puts "Key: #{key}"
#     puts "Value: #{value}"
# end
    


# JSON.parse(open("#{Rails.root}/db/1998_stats.json").read).each do |player|
#     puts player[1][1]
#     # team = Team.new(stuff)
#     # team.id = stuff['id']
#     # team.save!
# end
