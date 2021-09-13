require 'json'

current_year = 2021
file_data = File.read(File.join(File.dirname(__FILE__), '/raw-cal.txt')).lines

year_to_month = {
    current_year => {},
    (current_year + 1) => {},
}

cur_month = nil

file_data.each do |line|
    line = line.strip
    if line == ''
        next
    elsif /^\d+|TBD/.match(line)
        event = line.split()
        year_to_month[current_year][cur_month].push({
            "day" => event[0],
            "event" => event[1..-1].join(' '),
        })
    else
        cur_month = line
        if cur_month == "January"
            current_year = current_year + 1
        end
        year_to_month[current_year][cur_month] = []
    end
end

ans = []
year_to_month.each do |year, months|
    months_in_year = []
    months.each do |month, month_data|
        months_in_year.push({
            "month" => month,
            "events" => month_data,
        })
    end
    ans.push({
        "year" => year,
        "months" => months_in_year
    })
end

File.write(File.join(File.dirname(__FILE__), '../_data/calendar.json'), ans.to_json)