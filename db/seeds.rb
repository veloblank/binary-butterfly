espn = "http://fantasy.espn.com/streak/en/"
doc = Nokogiri::HTML(open(espn))
props = doc.css(".matchup-container")

props.each do |p|
  date = p.css(".startTime").attr("data-locktime").value

  #If turning into a weekly contest a la American football (NFL) with weekly games
  #contest_board = ContestBoard.find_or_create_by(name: "#{Date.today.cweek}")
  
  contest_board = ContestBoard.find_or_create_by(name: "#{DateTime.now.beginning_of_day}")
  ContestProp.create(
    title:  p.css(".gamequestion").text,
    date: DateTime.parse(date).in_time_zone('Eastern Time (US & Canada)').to_date,
    start_time: DateTime.parse(date).in_time_zone('Eastern Time (US & Canada)'),
    sport: p.css(".sport-description").text,
    away_team: p.css("td span strong")[0].text,
    home_team: p.css("td span strong")[1].text,
    contest_board_id: contest_board.id
  )


end

100.times do
    email = Faker::Internet.free_email
    username = Faker::Internet.username
    #password = Faker::Internet.password(8)
    #password = "1234567890"
    user = User.create(email: email, username: username)
  end

  props = ContestProp.all.count
  sides = ["home", "away"]
  User.all.each do |user|
    arr = Array(1..props).sample(props)
    confidence = Array(1..25)
    arr.each_with_index do |arg, n|
      user.user_picks.create(contest_prop_id: arr[n], confidence: confidence.sample, side: sides.sample)
    end
  end