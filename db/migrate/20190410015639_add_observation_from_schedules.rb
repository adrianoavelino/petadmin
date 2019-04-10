class AddObservationFromSchedules < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :observation, :text
  end
end
