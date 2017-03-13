class AddDrawingToGraffiti < ActiveRecord::Migration
  def change
    add_column :graffitis, :drawing, :jsonb, null: false, default: Array.new(15) { Array.new(31) { "" } }
  end
end
