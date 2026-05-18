#!/usr/bin/env ruby
require 'net/http'
require 'uri'
require 'json'

def post_request(url, body_params)
  uri = URI(url)
  
  # Sorğunu application/json formatında və body-ni JSON-a çevirərək göndəririk
  response = Net::HTTP.post(uri, body_params.to_json, { 'Content-Type' => 'application/json' })
  
  # Cavabı ekrana çıxarırıq
  puts "Response status: #{response.code} #{response.message}"
  puts "Response body:"
  puts response.body
end
