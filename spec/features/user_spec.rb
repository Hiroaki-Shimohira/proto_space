require 'rails_helper'
feature 'User' do
  # given(:user) {build(:user)}
  # given(:login_user) {create(:user)}
  # given(:prototype) { create(:prototype_with_capture_image) }
  # # given(:capture_image) { create(:capture_image, :image, :main, prototype_id: prototype) }
  # # given(:prototype_with_capture_image)
  given(:login_user) { create(:user) }
  given(:user) { build(:user)}
  given(:prototype) { build(:prototype) }
  scenario "user sign_up" do
    visit root_path
    click_link 'Get Started'
    click_on 'Sign up now'
    fill_in 'Username', with: user.nickname
    fill_in 'E-Mail', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Member', with: user.member
    fill_in 'Profile', with: user.profile
    fill_in 'Works', with: user.works
    click_button 'Save'
    expect(current_path).to eq root_path
  end
  scenario "sign_in and post prototype" do
    visit root_path
    click_on 'Get Started'
    fill_in 'Email address', with: login_user.email
    fill_in 'Password', with: login_user.password
    click_button "Sign in"
    expect(current_path).to eq root_path
    click_on "New Proto"
    fill_in "Title", with: prototype.title
    fill_in "Catch Copy", with: prototype.catchcopy
    fill_in "Concept", with: prototype.concept
    attach_file "prototype[capture_images_attributes][0][image_url]", "spec/fixtures/img/aaaa.png"
    click_button 'publish'
    expect(current_path).to eq root_path
  end

end