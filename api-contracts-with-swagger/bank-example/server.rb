#!/usr/bin/env ruby
require 'sinatra'
set :public_folder, '.'

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

get '/editor/spec' do
  input = File.join(settings.public_folder, 'spec-files/schema.yaml')
  contents = File.read(input)
  return contents
end

put '/editor/spec' do
  body = request.body.read
  output = File.join(settings.public_folder, 'spec-files/schema.yaml')
  File.write(output, body)
end
