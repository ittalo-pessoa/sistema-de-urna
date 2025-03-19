class CreateCandidaturas < ActiveRecord::Migration[7.2]
  def change
    create_table :candidaturas do |t|
      t.string :nome_candidato
      t.string :nome_urna
      t.references :turma, foreign_key: true
      t.string :vice_lider
      t.string :nome_urna_vice
      t.string :foto_lider
      t.string :foto_vice

      t.timestamps
    end
  end
end

