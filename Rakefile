# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Prodcase::Application.load_tasks

namespace :loadapi do
	
	desc "display desk.com data"
	task :deskdata => :environment do
		require 'json'
		website = `curl https://mycaseinc.desk.com/api/v2/cases -u matt@mycaseinc.com:kappasig1 -H 'Accept: application/json'`
		data = JSON.parse(website)

		data['_embedded']['entries'].each do |line|
			blurb = line['blurb'] 
			date = line['created_at'].to_date
			Ticket.create(ticket_type: 'request', body: blurb, date: date)
		end
	end

	task :update_features => :environment do
		ticket = Ticket.all
    feature_ideas = ["time tracking", "billing", "workflow", "Android", "Outlook"]
    ticket.each do |t|
    	if t.body != nil && t.read != true
	      feature_ideas.each do |an_idea|
	        if t.body.include?(an_idea)
	          f = Feature.find_or_create_by_title(an_idea)
	          f.mentions = 0 if f.mentions.nil?
	          f.mentions += 1
	          # f.tickets += ticket
	          f.save!
	        end
	      end
	    end
	    t.read = true
	    t.save
    end
	end
end
