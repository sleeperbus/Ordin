require 'csv'
require 'sunlight/congress'
require 'erb'
Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

puts "EventManager Initialized!"

def clean_zipcode(zipcode)
	zipcode.to_s.rjust(5, "0")[0..4]
end

def legislators_by_zipcode(zipcode)
	legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id, form_letter)
	Dir.mkdir("output") unless File.exists?("output")

	filename = "output/thanks_#{id}.html"
	File.open(filename, "w") { |file| file.puts form_letter }
end

template_letter = File.read("form_letter.html")
erb_template = ERB.new(template_letter)

contents = CSV.open("event_attendees.csv", headers: true, header_converters: :symbol)
contents.each do |row|
	id = row[0]
	name = row[:first_name]
	zipcode = clean_zipcode(row[:zipcode])
	legislators = legislators_by_zipcode(zipcode)

	form_letter = erb_template.result(binding)
	save_thank_you_letters(id, form_letter)
end
