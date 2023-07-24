class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  ratyrate_rater
  def self.find_or_create_by_name(name)
    user =  User.find_by(full_name:  name)
    user.present? ? user : User.create(full_name: name, email: generate_temp_email)
  end

  def self.generate_temp_email
    random_string = SecureRandom.hex(8)  # Generate an 8-character random string in hexadecimal format
    domain = 'tempemail.com'  # Choose a domain for temporary email

    temp_email = random_string + '@' + domain
    return temp_email
  end
end
