espn = "http://fantasy.espn.com/streak/en/"
doc = Nokogiri::HTML(open(espn))
props = doc.css(".matchup-container")

props.each do |p|
  date = p.css(".startTime").attr("data-locktime").value
  contest_board = ContestBoard.find_or_create_by(name: "#{Date.today.cweek}")
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
