require "csv"
namespace :read_csv do
	task :import_csv => :environment do
		# csv_text = File.read("C:/Users/user/Desktop/all_uni/awad/activities/a.csv")
		csv_text = File.read("C:/Users/user/Downloads/import.csv")
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
			row = row.to_hash.with_indifferent_access
			School.create!(row.to_hash.symbolize_keys)
			puts row
		end		
	end
end
