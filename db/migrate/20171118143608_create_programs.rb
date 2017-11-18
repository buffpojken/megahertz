class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs do |t|
      t.string      :title
      t.text        :description
      t.integer     :duration
      t.string      :file_url
      t.timestamps
    end
  end
end
