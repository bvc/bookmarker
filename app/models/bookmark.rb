# == Schema Information
#
# Table name: bookmarks
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  url         :string(1000)
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  user_id     :integer
#

class Bookmark < ActiveRecord::Base
  attr_accessible :name, :url, :description
  belongs_to :user

  default_scope order: "bookmarks.created_at DESC"

  validates(:name, presence: true, :length => { maximum: 255 } )
  validates(:url, presence: true, :length => { maximum: 1000 }, :format => URI::regexp(%w(http https)) )
end
