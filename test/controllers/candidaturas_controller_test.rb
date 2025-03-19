require "test_helper"

class CandidaturasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @candidatura = candidaturas(:one)
  end

  test "should get index" do
    get candidaturas_url
    assert_response :success
  end

  test "should get new" do
    get new_candidatura_url
    assert_response :success
  end

  test "should create candidatura" do
    assert_difference("Candidatura.count") do
      post candidaturas_url, params: { candidatura: {  : @candidatura. , foto_lider: @candidatura.foto_lider, foto_vice: @candidatura.foto_vice, nome_candidato: @candidatura.nome_candidato, nome_urna: @candidatura.nome_urna, nome_urna_vice: @candidatura.nome_urna_vice, turma_id: @candidatura.turma_id, vice_lider: @candidatura.vice_lider } }
    end

    assert_redirected_to candidatura_url(Candidatura.last)
  end

  test "should show candidatura" do
    get candidatura_url(@candidatura)
    assert_response :success
  end

  test "should get edit" do
    get edit_candidatura_url(@candidatura)
    assert_response :success
  end

  test "should update candidatura" do
    patch candidatura_url(@candidatura), params: { candidatura: {  : @candidatura. , foto_lider: @candidatura.foto_lider, foto_vice: @candidatura.foto_vice, nome_candidato: @candidatura.nome_candidato, nome_urna: @candidatura.nome_urna, nome_urna_vice: @candidatura.nome_urna_vice, turma_id: @candidatura.turma_id, vice_lider: @candidatura.vice_lider } }
    assert_redirected_to candidatura_url(@candidatura)
  end

  test "should destroy candidatura" do
    assert_difference("Candidatura.count", -1) do
      delete candidatura_url(@candidatura)
    end

    assert_redirected_to candidaturas_url
  end
end
