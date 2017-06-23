def get_first_name_of_season_winner(data, season)
  winner = data[season].detect do |contestant|
    contestant["status"] == "Winner"
  end
  winner["name"].split(" ").first
end

def get_contestant_name(data, occupation)
  data.each do |season, contestants|
    woman = contestants.detect do |contestant|
      contestant["occupation"] == occupation
    end
    if woman != nil
      return woman["name"]
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season, contestants|
    contestants.delete_if do |contestant|
      contestant["hometown"] != hometown
    end

    count = count + contestants.length
  end
  count
end

def get_occupation(data, hometown)
  data.each do |season, contestants|
    woman = contestants.detect do |contestant|
      contestant["hometown"] == hometown
    end

    if woman != nil
      return woman["occupation"]
    end
  end
end

def get_average_age_for_season(data, season)
  ages = data[season].collect do |contestant|
    contestant["age"].to_f
  end

  (ages.reduce(:+)/ages.length.to_f).round
end
