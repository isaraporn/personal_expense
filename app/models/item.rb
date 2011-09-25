class Item < ActiveRecord::Base
  belongs_to :category
end


# == Schema Information
#
# Table name: items
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  category_id :integer
#  expense     :float
#  created_at  :datetime
#  updated_at  :datetime
#  total       :float
#

