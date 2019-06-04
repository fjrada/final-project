# == Schema Information
#
# Table name: interactions
#
#  id         :integer          not null, primary key
#  contact_id :integer
#  details    :text
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Interaction < ApplicationRecord

belongs_to :contact

end
