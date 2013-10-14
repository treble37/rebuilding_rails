# best_quotes/sqlite_test.rb
require "sqlite3"
require "rulers/sqlite_model"
class MyTable < Rulers::Model::SQLite; end
STDERR.puts MyTable.schema.inspect
# Create row
# mt = MyTable.create "title" => "I saw it again!", "body" => "This is a quote body example"
mt = MyTable.find(MyTable.count)
puts "Count: #{MyTable.count}"
top_id = mt["id"].to_i
  (1..top_id).each do |id|
  mt_id = MyTable.find(id)
  puts "Found title #{mt_id["title"]}."
end

mt_obj = MyTable.find_by_title(:title=>"I saw it again!")
puts mt_obj["title"] + " title finder method success!"
mt_obj = MyTable.find_by_body(:body=>"This is a quote body example")
puts mt_obj["body"] + " body finder method success!"

# def func(*args)
#   puts *args[0].to_s+" args[0]"
#   puts *args[1].to_s+" args[1]"
#   puts *args.to_s+" *args"
#   puts args.to_s+" args"
#   puts args[0][args[0].keys.first]
# end
# func(:title=>"heavyweight champ")


# Create row
# mt = MyTable.create "title" => "I saw it again!"
# mt["title"] = "I really did!"
# mt.save!
# mt2 = MyTable.find mt["id"]
# puts "Title: #{mt2["title"]}"