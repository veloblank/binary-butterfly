class Api::V1::ContestPropsController < ApplicationController

  def index
    sync_with_espn
    contest_week = ContestWeek.find_by(:id => params[:contest_week_id])
    if contest_week
      contest_props = ContestProp.filter_by_contest_week(contest_week)
    else
      contest_props = ContestProp.all
    end

    render json: contest_props, status: 200

  end

  private

  def sync_with_espn
    espn = "http://fantasy.espn.com/streak/en/"
    doc = Nokogiri::HTML(open(espn))
    props = doc.css(".matchup-container")

    props.each do |p|
      date = p.css(".startTime").attr("data-locktime").value
      contest_week = ContestWeek.find_or_create_by(name: "#{Date.today.cweek}")
      ContestProp.create(
        title:  p.css(".gamequestion").text,
        date: DateTime.parse(date).in_time_zone('Eastern Time (US & Canada)').to_date,
        start_time: DateTime.parse(date).in_time_zone('Eastern Time (US & Canada)'),
        sport: p.css(".sport-description").text,
        away_team: p.css("td span strong")[0].text,
        home_team: p.css("td span strong")[1].text,
        contest_week_id: contest_week.id
      )


    end
end
