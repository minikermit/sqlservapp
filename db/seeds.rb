# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

["Basel II","Swiss Reporting", "Luxembourg Reporting", "Singapore Reporting","Fire", "Fimis", "Green Book", "CF Reporting","Other", "Management"].each do |title|
   Project.create!(:title => title, :comments => "basic sample seed data - to change")


["Admin","Publisher","Simple User","Advanced User","Guest"].each do |name|
   Role.create!(:name => name)
end
  

#           Post.create(:title => "Welcome to the blog",
#                  :content => "Welcome to my blog! I hope you enjoy it!",
#                  :author => User.find_by_name("Chuck Wood"))


#require ‘FasterCSV’

#FasterCSV.foreach(”#{RAILS_ROOT}/db/seed/data.csv” , :headers=>true) do |row|
#print “Created #{row}” if TargetSelector.create_if_notexist(Hash.new.replace row)
#end


end