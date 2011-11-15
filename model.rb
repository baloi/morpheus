require 'sinatra/activerecord'

set :database, 'sqlite://development.db'

class Therapist < ActiveRecord::Base

end
