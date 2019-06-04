# == Schema Information
#
# Table name: relationships
#
#  id          :integer          not null, primary key
#  owner_id    :integer
#  relative_id :integer
#  nature      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Relationship < ApplicationRecord

belongs_to :owner, :class_name => "Contact"
belongs_to :relative, :class_name => "Contact"

end
