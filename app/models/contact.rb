# == Schema Information
#
# Table name: contacts
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  main_contact      :integer
#  city              :string
#  job               :string
#  birthday          :datetime
#  note              :text
#  name              :string
#  last_name         :string
#  nickname          :string
#  country_of_origin :string
#  category_id       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Contact < ApplicationRecord

belongs_to :user
has_many :relationships, :foreign_key => "owner_id", :dependent => :destroy
has_many :relatives, :class_name => "Relationship", :foreign_key => "relative_id", :dependent => :destroy
has_many :interactions, :dependent => :destroy
has_many :memberships, :dependent => :destroy
belongs_to :category

end
