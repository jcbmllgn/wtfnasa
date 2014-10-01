# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

facts = JSON.parse(File.read("#{Rails.root}/db/wtfnasa_facts.json"))
facts.each do |fact|

  if Fact.where( title: fact['title'] ).count == 0

    @fact = Fact.new()

    @fact.title = fact['title']
    @fact.description = fact['learn_more']
    @fact.url = fact['source']
    @fact.upvote = 0
    @fact.downvote = 0

    @fact.save!

    puts "Created fact: #{@fact.title}"

  else

    puts "Fact already exists: #{ fact['title'] }"
  end

end