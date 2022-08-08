class Guest < ApplicationRecord

  def self.guest
    find_or_create_by!(email: 'guest@com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end