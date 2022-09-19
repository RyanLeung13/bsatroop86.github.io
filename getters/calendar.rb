require 'csv'
require 'json'

raw = `curl -L "https://docs.google.com/spreadsheets/d/1mr3wZuE35yQrhDPB4V7iuS48hosQhyfHIgwiZjcuStY/export?format=csv&id=1mr3wZuE35yQrhDPB4V7iuS48hosQhyfHIgwiZjcuStY&gid=0"`
csv = CSV.parse(raw)
orgnized = Hash.new
csv.each do |event|
    if !orgnized.has_key?(event[0])
        orgnized[event[0]] = Hash.new
    end

    if !orgnized[event[0]].has_key?(event[1])
        orgnized[event[0]][event[1]] = []
    end

    orgnized[event[0]][event[1]].push({
        "day" => event[2],
        "event" => event[3]
    })
end

final = []
orgnized.each do |year, months|
    month_final = []
    months.each do | month, events|
        month_final.push({
            "month" => month,
            "events" => events
        })
    end
    final.push({
        "year" => year,
        "months" => month_final
    })
end

File.write('./_data/calendar.json', final.to_json)
