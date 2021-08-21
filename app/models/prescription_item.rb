# == Schema Information
#
# Table name: prescription_items
#
#  id              :bigint           not null, primary key
#  uid             :string
#  prescription_id :bigint           not null
#  medicament      :string
#  posologie       :string
#  comments        :text
#  status          :string
#  user_id         :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class PrescriptionItem < ApplicationRecord
  belongs_to :prescription
  belongs_to :user
end
