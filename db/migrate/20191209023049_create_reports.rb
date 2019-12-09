class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.integer :accident_id
      t.date :date_of_report
      t.time :time_of_report
      t.string :contractor_name
      t.string :vehicle_used
      t.string :location
      t.string :employee_description

      t.timestamps
    end
  end
end
