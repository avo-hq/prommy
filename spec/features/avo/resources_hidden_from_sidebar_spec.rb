require "rails_helper"

RSpec.feature "ResourcesHiddenFromSidebar", type: :feature do
  describe "a visible resource" do
    it "displays the resource" do
      visit "/admin/resources/posts"

      expect(page.body).to have_text "Posts"
    end
  end

  describe "a hidden resource" do
    it "does not display the resource but can access it" do
      visit "/admin/resources/posts"

      expect(page.body).not_to have_text "Memberships"

      visit "/admin/resources/memberships"

      expect(page.body).to have_text "Memberships"
    end
  end
end
