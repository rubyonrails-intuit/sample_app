require 'spec_helper'

describe "StaticPages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }

    let(:heading) { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers

      # Old
      # get static_pages_index_path
      # response.status.should be(200)
  end

  describe "Help page" do
  	before { visit help_path }

    let(:heading) { 'Help' }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"

    it { should have_content('Help') }
    it { should have_title(full_title("#{page_title}")) }
  end

  describe "About page" do
  	before { visit about_path }

    it { should have_content('About Us') }
    it { should have_title(full_title('About Us')) }
  end

  describe "Contact page" do
  	before { visit contact_path }

    it { should have_selector('h1', text: 'Contact') }
    it { should have_title(full_title('Contact')) }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))

    click_link "Help"
    expect(page).to have_title(full_title('Help'))

    click_link "Home"
    expect(page).to have_title(full_title(''))

    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))

    click_link "sample app"
    expect(page).to have_title(full_title(''))

  end

end
