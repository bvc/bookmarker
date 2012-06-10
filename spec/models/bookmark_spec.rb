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

require 'spec_helper'

describe Bookmark do
  let(:user) { FactoryGirl.create(:user) }
  before { @bookmark = user.bookmarks.build(name: "", url: "http://www.example.com", description: "" ) }

  subject { @bookmark }

  it { should respond_to(:name) }
  it { should respond_to(:url) }
  it { should respond_to(:description) }
  it { should respond_to(:user) }
  it { should respond_to(:user_id) }

  its(:user) { should == user }

  it { should be_valid }

  describe "when name is not present" do
    before { @bookmark.name = "" }
    it { should be_valid }
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

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Bookmark.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
