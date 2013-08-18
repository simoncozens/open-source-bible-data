require 'spreadsheet'
require 'json'

book = Spreadsheet.open(ARGV.shift)
sheet1 = book.worksheet 0
day = 0
cday = nil
verses = []
sheet1.each do |row|
    if row[0] == "Date"
        next
    end
    date = row[0]
    if date != cday
        day = day + 1
        cday = date
    end
    verses[day] = [] unless verses[day]
    verses[day].push(row[7])
end

(0..365).each { |i| verses[i] = verses[i].join("; ") if verses[i] }
puts JSON[ { info: "St Aldates Church Bible-in-a-year programme", days:
verses }]
