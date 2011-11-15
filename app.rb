require 'sinatra'
require './model'

get '/' do
  therapist = Therapist.create(:name => 'baloi')
  "hello world"
end

get '/therapists' do
  therapists = Therapist.find(:all)
  ret = "" 

  therapists.each do |t|
   ret += "Welcome #{t.name}<br/>"
  end
    
  ret
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

