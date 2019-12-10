class CreateAccidents < ActiveRecord::Migration[6.0]
  def change
    create_table :accidents do |t|
      t.datetime :datetime_of_accident

      t.timestamps
    end
  end
end
