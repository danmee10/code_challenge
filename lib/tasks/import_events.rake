require 'csv'

desc "Imports events from given CSV file."
task :import_events => :environment do
  contents = File.read('test_events.csv')
  csv = CSV.parse(contents, headers: true)
  csv.each do |row|
    start = format_date(row['start'])
    finish = format_date(row['finish'])
    track = row['track']
    name = row['name']
    EventListing.create!(start: start,
                        finish: finish,
                         track: track,
                          name: name)
  end
end

def format_date(date)
  date.split(' ').map do |x|
    arr = x.split("/")
    if arr.length > 1
      year = arr.pop
      arr.unshift(year)
    end
    arr.join('/')
  end.join(' ')
end