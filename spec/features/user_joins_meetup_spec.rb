require 'spec_helper'

feature 'join meetup', js: true do

  let!(:meetup) {
    Meetup.create(
      name: 'Tennis Gathering',
      description: 'A gathering of formidable players.',
      location: 'Tampa'
    )
  }

  let!(:meetup_creator){
    User.create(
      provider: 'github',
      uid: '2',
      username: 'hellokitty',
      email: 'dgsparks1@gmail.com',
      avatar_url: 'http://www.pngall.com/wp-content/uploads/2016/03/Tennis-Ball-PNG-Clipart.png'
    )
  }

  let!(:membership){
    MeetupMembership.create(
      user: meetup_creator,
      meetup: meetup,
      creator_id: true
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

  context 'when not signed in' do
    scenario 'user unsuccessfully joins meetup' do
      visit '/meetups/1'
      expect(page).to_not have_content "Join!"
    end
  end

  context 'when signed in', js: true do
    scenario 'user successfully joins meetup' do
      visit '/'
      sign_in_as user
      visit '/meetups/1'

      expect(page).to have_content 'Join!'

      click_link 'Join!'
      expect(page).to have_content 'Leave Meetup'
      expect(meetup.users).to include user
    end
  end


end
