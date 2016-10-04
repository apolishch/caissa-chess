class RemoeGameIdFromPiece < ActiveRecord::Migration
  def change
    remove_column :pieces, :game_id if column_exists? :pieces, :game_id
  end
end
