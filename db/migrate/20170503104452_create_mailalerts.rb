class CreateMailalerts < ActiveRecord::Migration[5.1]
  def change
    create_table :mailalerts do |t|
      t.string :alert

      t.timestamps
    end
  end
end
