# == Schema Information
#
# Table name: interests
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Interest < ApplicationRecord

belongs_to :user
has_many :memberships, :dependent => :destroy

end
