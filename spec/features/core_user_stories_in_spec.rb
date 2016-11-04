require 'spec_helper'

feature "user views list of meetups" do
  let!(:meetup) {
    Meetup.create(
      name: 'Tennis Gathering',
      description: 'A gathering of formidable players.',
      location: 'Tampa'
    )
  }

  let!(:user) {
    User.create(
      provider: 'github',
      uid: '1',
      username: 'darthestar',
      email: 'dgsparks@gmail.com',
      avatar_url: 'http://www.pngall.com/wp-content/uploads/2016/03/Tennis-Ball-PNG-Clipart.png'
    )
  }

  let!(:user_meetup) {
    MeetupMembership.create(
    user: user,
    meetup: meetup,
    creator_id: true
    )
  }

  scenario 'user views meetups' do
    visit '/'
    expect(page).to have_content "Tennis Gathering"
  end

  scenario "successfully see details of a meetup" do
    visit '/'
    sign_in_as user
    click_link "Tennis Gathering"

    expect(page).to have_content "A gathering of formidable players."
    expect(page).to have_current_path("/meetups/#{meetup.id}")
    expect(page).to have_content "darthestar"
  end

  scenario 'user successfully creates a meetup' do
    visit '/'
    sign_in_as user
    click_link "Create A Meetup"
    fill_in 'Name of Meetup', with: 'Movie Buff Group'
    fill_in 'Location', with: 'St Petersburg'
    fill_in 'Description', with: 'Movie lovers sharing reviews'
    click_button 'Submit'

    expect(page).to have_content "You have created a new Meetup!"
  end
end
