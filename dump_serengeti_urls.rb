#!/usr/bin/env ruby

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'mongo'
end

require 'csv'

db = Mongo::Client.new('mongodb://localhost:27017/serengeti')

CSV.open("data/subjects.csv", 'wb', headers: ['zooniverse_id', 'image_index', 'image_url', 'subject_group_id', 'image_timestamp'], write_headers: true) do |csv|
  db['serengeti_subjects'].find(group_id: BSON::ObjectId("54cfc76387ee0404d5000001")).each do |document|
    (document["location"] || {"standard" => []})["standard"].each.with_index do |url, idx|
      print '.'
      csv << [document["zooniverse_id"], idx, url, document["group_id"], document["metadata"]["timestamps"][idx]]
    end
  end
end
