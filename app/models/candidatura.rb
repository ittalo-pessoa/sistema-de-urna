class Candidatura < ApplicationRecord
  belongs_to :turma
  has_one_attached :foto_lider
  has_one_attached :foto_vice
  attribute :votos, :integer, default: 0
end
