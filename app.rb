require 'sinatra'
require 'sinatra/activerecord'

get '/' do
  "hello world"
end

#post '/therapist' do
#  name = "#{params[:therapist_name].strip}"
#
#  @therapist = Therapist.new(:name => name)  
#  @errors = []
#
#  if @therapist.save
#    redirect '/therapist/list'
#  else
#    @therapist.errors.each do |e|
#      @errors << e
#      puts ">>>#{e}<<<"
#    end
#
#    redirect '/therapist/error'
#  end
#end
#

