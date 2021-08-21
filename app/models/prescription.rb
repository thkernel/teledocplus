# == Schema Information
#
# Table name: prescriptions
#
#  id         :bigint           not null, primary key
#  uid        :string
#  doctor_id  :bigint
#  patient_id :bigint
#  status     :string
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Prescription < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :user


  has_many :prescription_items, dependent: :destroy
  accepts_nested_attributes_for :prescription_items ,  allow_destroy: true
end
