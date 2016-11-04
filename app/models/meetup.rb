class Meetup < ActiveRecord::Base
  has_many :meetup_memberships
  has_many :users, through: :meetup_memberships

  validates :name, presence: true
  validates :description, presence: true, length: { minumum: 5, maximum: 200 }
  validates :location, length: { minimum: 2 }, presence: true

end
