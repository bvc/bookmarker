require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector("h1", text: "Bookmarker") }
    it { should have_selector("h2", text: "All your bookmarks are belong to us!") }
    it { should have_selector("title", text: full_title('')) }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do


        sign_in user
        visit root_path
      end
    end
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector("h1", text: "About") }
    it { should have_selector("title", text: full_title("About"))}
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector("h1", text: "Contact") }
    it { should have_selector("title", text: full_title("Contact"))}
  end
end
