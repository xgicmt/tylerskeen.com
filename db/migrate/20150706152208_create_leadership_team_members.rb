class CreateLeadershipTeamMembers < ActiveRecord::Migration
  def change
    create_table :leadership_team_members do |t|
      t.string :name
      t.string :picture
      t.text :synopsis

      t.timestamps null: false
    end
  end
end
