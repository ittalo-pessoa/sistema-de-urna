class AddVotosEmBrancoToTurmas < ActiveRecord::Migration[7.2]
  def change
    add_column :turmas, :votos_em_branco, :integer
  end
end
