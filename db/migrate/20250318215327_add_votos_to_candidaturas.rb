class AddVotosToCandidaturas < ActiveRecord::Migration[7.2]
  def change
    add_column :candidaturas, :votos, :integer
  end
end
