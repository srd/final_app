# == Schema Information
# Schema version: 20110225134824
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  login              :string(255)     not null
#  email              :string(255)     not null
#  crypted_password   :string(255)     not null
#  password_salt      :string(255)     not null
#  persistence_token  :string(255)     not null
#  login_count        :integer         default(0), not null
#  failed_login_count :integer         default(0), not null
#  last_request_at    :datetime
#  current_login_at   :datetime
#  last_login_at      :datetime
#  current_login_ip   :string(255)
#  last_login_ip      :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class User < ActiveRecord::Base
  acts_as_authentic do |c|
    failed_login_ban_for = 24.hours
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end

end
