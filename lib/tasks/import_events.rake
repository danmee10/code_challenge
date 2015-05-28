require 'csv'

desc "Imports events from given CSV file."
task :import_events => :environment do
  contents = File.read('test_events.csv')
  csv = CSV.parse(contents, headers: true)
  csv.each do |row|
    EventListing.create!(row.to_hash)
  end
end
