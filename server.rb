require 'sinatra/base'

class MyApp < Sinatra::Base
  get '/' do
    'Hello, nginx and unicorn!'
  end

  get  '/ping' do
    'everything is up and running'
  end
end
