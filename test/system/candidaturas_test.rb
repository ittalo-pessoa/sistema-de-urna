require "application_system_test_case"

class CandidaturasTest < ApplicationSystemTestCase
  setup do
    @candidatura = candidaturas(:one)
  end

  test "visiting the index" do
    visit candidaturas_url
    assert_selector "h1", text: "Candidaturas"
  end

  test "should create candidatura" do
    visit candidaturas_url
    click_on "New candidatura"

    fill_in "", with: @candidatura. 
    fill_in "Foto lider", with: @candidatura.foto_lider
    fill_in "Foto vice", with: @candidatura.foto_vice
    fill_in "Nome candidato", with: @candidatura.nome_candidato
    fill_in "Nome urna", with: @candidatura.nome_urna
    fill_in "Nome urna vice", with: @candidatura.nome_urna_vice
    fill_in "Turma", with: @candidatura.turma_id
    fill_in "Vice lider", with: @candidatura.vice_lider
    click_on "Create Candidatura"

    assert_text "Candidatura was successfully created"
    click_on "Back"
  end

  test "should update Candidatura" do
    visit candidatura_url(@candidatura)
    click_on "Edit this candidatura", match: :first

    fill_in "", with: @candidatura. 
    fill_in "Foto lider", with: @candidatura.foto_lider
    fill_in "Foto vice", with: @candidatura.foto_vice
    fill_in "Nome candidato", with: @candidatura.nome_candidato
    fill_in "Nome urna", with: @candidatura.nome_urna
    fill_in "Nome urna vice", with: @candidatura.nome_urna_vice
    fill_in "Turma", with: @candidatura.turma_id
    fill_in "Vice lider", with: @candidatura.vice_lider
    click_on "Update Candidatura"

    assert_text "Candidatura was successfully updated"
    click_on "Back"
  end

  test "should destroy Candidatura" do
    visit candidatura_url(@candidatura)
    click_on "Destroy this candidatura", match: :first

    assert_text "Candidatura was successfully destroyed"
  end
end
