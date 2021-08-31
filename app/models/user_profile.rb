# == Schema Information
#
# Table name: user_profiles
#
#  id         :bigint           not null, primary key
#  uid        :string
#  first_name :string
#  last_name  :string
#  gender     :string
#  describe   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserProfile < ApplicationRecord
  # Include shared utils.
  include SharedUtils::Generate

  #self.table_name = "profile"


  before_save :generate_random_number_uid
  
  has_one :user, as: :userable
  has_one :address, as: :addressable,  dependent: :destroy
  accepts_nested_attributes_for :address


  
  # For active storage
  has_one_attached :avatar


 
  
  def full_name
    
    "#{first_name} #{last_name}"
  end

 
  
 
 
end
