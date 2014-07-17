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
end
