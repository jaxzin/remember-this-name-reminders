#!/usr/bin/env ruby
require "gibbon"
puts "Sending reminder..."

gb = Gibbon.new #uses envvar MAILCHIMP_API_KEY

list = gb.lists({:filters => {:list_name => "Remember This Name Daily Reminders"}})

puts "list = #{list}"

campaign = gb.campaignCreate( {:type => :regular, :options => {:list_id => list['data'][0]['id'], :subject => "Today, Let's Remember", :from_email => "daily@rememberthisname.org", :from_name => "Remember This Name", :to_name => "Remember This Name Followers", :template_id => 22745, :generate_text => true }, :content => {:html => "<h1>Allison N. Wyatt</h1>She was a kind-hearted girl.", :html_std_preheader_content => "Allison was kind.", 'html_repeat_1:0:postcard_heading00' => "<h1>Today, Let's Remember</h1>", 'html_repeat_1:0:std_content00' => "<h1>Allison N. Wyatt</h1>She was a kind-hearted girl." } } )

puts "campaign = #{campaign}"

success = gb.campaignSendNow({:cid => campaign})

puts "done. (success: #{success})"
