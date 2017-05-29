require 'sinatra/base'

class MyApp < Sinatra::Base
  get '/' do
    'Hello here, I am running on nginx, unicorn, and sinatra'
  end

  get  '/ping' do
    'everything is up and running'
  end
end
