class AdminUser < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :address, :age, :sex, :birthdate, :mobile, :email, :username, :secret_q
  
  # has_and_belongs_to_many :pediatrics
  # has_and_belongs_to_many :orthodontics
  # has_and_belongs_to_many :inventories
  # has_and_belongs_to_many :schedules

  attr_accessor :password
  attr_accessor :secret_a

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  # "sexy" validations
  validates :first_name, :presence => true, :length => {:maximum => 25}
  validates :last_name, :presence => true, :length => {:maximum => 50}
  validates :email, :presence => true, :length => {:maximum => 100},
    :format => EMAIL_REGEX, :confirmation => true
    
  # only on create, so other attributes of this user can be changed
  validates_length_of :password, :within => 8..25, :on => :create
  
  before_save :create_hashed_password
  after_save :clear_password

  before_save :create_hashed_answer
  after_save :clear_answer
  
  attr_protected :hashed_password, :salt
  attr_protected :hashed_secret_a, :salt
  
  scope :named, lambda {|first,last| where(:first_name => first, :last_name => last)}
  scope :sorted, order("admin_users.last_name ASC, admin_users.first_name ASC")
  
  def self.search(search, page) 
  paginate :per_page => 10, :page => page,
           :conditions => ['first_name || lower(first_name) LIKE ?', "%#{search}%"],
           :order => 'first_name'
  end

  def name
    "#{first_name} #{last_name}"
  end

  def self.authenticate(username="", password="")
    user = AdminUser.find_by_username(username)
    if user && user.password_match?(password)
      return user
    else
      return false
    end
  end

  # find email address
  def self.email_address(email="")
    address = AdminUser.find_by_email(email)
    if address
      return address
    else
      return false
    end
  end

  # authenticate secret question and answers
  def self.authenticate_secret(secret_q="", secret_a="")
    question = AdminUser.find_by_secret_q(secret_q)
    if question && question.secret_a?(secret_a)
      return question
    else
      return false
    end
  end

  def secret_a?(secret_a="")
    hashed_secret_a == AdminUser.hash_secret_with_salt(secret_a, salt)
  end

  # The same password string with the same hash method and salt
  # should always generate the same hashed_password.
  def password_match?(password="")
    hashed_password == AdminUser.hash_with_salt(password, salt)
  end
  

  def self.make_salt(username="")
    Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
  end

  def self.hash_with_salt(password="", salt="")
  	Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end

  # hash secret answer
  def self.hash_secret_with_salt(secret_a="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{secret_a}")
  end

  private

  def create_hashed_password
    unless password.blank?
      self.salt = AdminUser.make_salt(username) if salt.blank?
      self.hashed_password = AdminUser.hash_with_salt(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end

  def create_hashed_answer
    unless secret_a.blank?
      self.salt = AdminUser.make_salt(username) if salt.blank?
      self.hashed_secret_a = AdminUser.hash_secret_with_salt(secret_a, salt)
    end
  end

  def clear_answer
    self.secret_a = nil
  end

end
