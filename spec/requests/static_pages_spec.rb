require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector("h1", text: "Bookmarker") }
    it { should have_selector("h2", text: "All your bookmarks are belong to us!") }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector("h1", text: "About") }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector("h1", text: "Contact") }
  end
end
