require 'sinatra/activerecord'

if $TEST == true
  set :database, 'sqlite://experimental.db'
else
  set :database, 'sqlite://development.db'
end

class Therapist < ActiveRecord::Base
  #has_many :residents
  has_many :treatments

  #def active_residents
  #  ar = residents.select{|x| x.active == true}
  #  ar
  #end

end

class Treatment < ActiveRecord::Base
#  has_many :resident_sessions
#  has_many :residents, :through => :resident_sessions

  belongs_to :therapist#, :required => false
  belongs_to :resident
  belongs_to :caseload
#  def self.find_all_groups
#    session_type = "Group"
#    find(:all, :conditions => ["type LIKE ? ", "%#{session_type}%"])
#  end
#
#  def is_group?
#    session_type = self.class.to_s
#    # if session type ends in 'Group'
#    if session_type =~ /Group$/
#      return true
#    else
#      return false
#    end
#  end
#  def details
#    str = "#{self.class} by #{self.therapist.name} starts at #{time_end_hhmm}, ending #{time_end_hhmm}"
#  end
#
#  def time_start_hhmm
#    time_to_hhmm(time_start)
#  end
#
#  def time_end_hhmm
#    time_to_hhmm(time_end)
#  end
#
#  def time_to_hhmm(time)
#    time.strftime("%I:%M %p")
#  end
#
#  # Returns time_start in 'hh:mm p' format
#  # ex. 08:30 AM
#  def starts_at(time)
#    #puts ">>> time_start_hhmm = #{time_start_hhmm} <<<"
#    #puts ">>> time = #{time} <<<"
#    if time_start_hhmm == time
#      return true
#    else
#      return false
#    end
#  end
#
end


class Caseload < ActiveRecord::Base
  has_many :treatments
end

class OccupationalTherapist < Therapist
  has_many :residents
end

class PhysicalTherapist < Therapist
  has_many :residents
end

class PTTreatment < Treatment 
end

class Resident < ActiveRecord::Base
  #has_many :resident_sessions
  #has_many :sessions, :through => :resident_sessions

  has_many :treatments

  belongs_to :physical_therapist
  #belongs_to :occupational_therapist

  validates_presence_of :name
  validates_uniqueness_of :name

  def last_name
    n = self[:name].split(',')
    n[0].strip
  end

  def first_name
    n = self[:name].split(',')
    n[1].strip
  end

  def self.sort_by_insurance
    find(:all, 
      :order => 'pt_minutes_per_day DESC, pt_days_per_week DESC, insurance')
  end

  def self.for_saturday
    find(:all, :conditions => "pt_days_per_week = 6")
  end

  def self.insurance_types
    ["Med A", "Med B", "Medicaid", "HMO", "RHMO", "VA"]
  end

end


class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email


  def self.authenticate(email, password)
    user = find_by_email(email)

    if user && user.password_hash == BCrypt::Engine.hash_secret(
          password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
