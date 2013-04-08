class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.integer :uprn
      t.string :blpu_class
      t.string :name
      t.string :street
      t.string :postcode
      t.integer :xref
      t.integer :yref
      t.string :address
      t.string :school_group

      t.timestamps
    end
  end
end
