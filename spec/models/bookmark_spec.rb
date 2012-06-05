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
#

require 'spec_helper'

describe Bookmark do

  before do
    @bookmark = Bookmark.new(name: "Example", url: "http://www.example.com", description: "" )
  end

  subject { @bookmark }

  it { should respond_to(:name) }
  it { should respond_to(:url) }
  it { should respond_to(:description) }

  it { should be_valid }

  describe "when name is not present" do
    before { @bookmark.name = "" }
    it { should_not be_valid }
  end

  describe "when url is not present" do
    before { @bookmark.url = "" }
    it { should_not be_valid }
  end

  describe "when url is not a valid url" do
    before { @bookmark.url = "something.com" }
    it { should_not be_valid }

    before { @bookmark.url = "htt://something.com" }
    it { should_not be_valid }
  end
end
