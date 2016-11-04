class CreateMeetupMemberships < ActiveRecord::Migration
  def change
    create_table :meetup_memberships do |t|
      t.integer :user_id, null: false
      t.integer :meetup_id, null: false
      t.boolean :creator_id, null: false
    end
  end

  def up
    # remove_column :meetups, :name
    change_column :table_name, :original_col_name, :new_col_name
  end

  def down
    # add_column :meetups, :name, :string, null: false
    change_column :table_name, :new_col_name, :original_col_name
  end
end

# UP/DOWN
# remove_column
# change_column

# CHANGE
# add_column
# create_table
# add_index
