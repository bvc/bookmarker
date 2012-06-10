require 'spec_helper'

describe "Bookmark pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "bookmark creation" do
    before { visit root_path }

    describe "with valid information" do
      before { fill_in "bookmark_url", with: "http://www.google.com" }
      it "should create a bookmark" do
        expect { click_button "Post" }.should change(Bookmark, :count).by(1)
      end
    end
  end

  describe "bookmark destruction" do
    before { FactoryGirl.create(:bookmark, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a bookmark" do
        expect { click_link "delete" }.should change(Bookmark, :count).by(-1)
      end
    end
  end
end