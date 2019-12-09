class CreateAccidents < ActiveRecord::Migration[6.0]
  def change
    create_table :accidents do |t|
      t.time :time_of_accident
      t.date :date_of_accident

      t.timestamps
    end
  end
end
