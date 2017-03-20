require 'test_helper'

class EquipePersosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipe_perso = equipe_persos(:one)
  end

  test "should get index" do
    get equipe_persos_url
    assert_response :success
  end

  test "should get new" do
    get new_equipe_perso_url
    assert_response :success
  end

  test "should create equipe_perso" do
    assert_difference('EquipePerso.count') do
      post equipe_persos_url, params: { equipe_perso: { argent: @equipe_perso.argent, effectif: @equipe_perso.effectif, nameteam: @equipe_perso.nameteam, nametrainer: @equipe_perso.nametrainer, pays: @equipe_perso.pays, statsgenerale: @equipe_perso.statsgenerale } }
    end

    assert_redirected_to equipe_perso_url(EquipePerso.last)
  end

  test "should show equipe_perso" do
    get equipe_perso_url(@equipe_perso)
    assert_response :success
  end

  test "should get edit" do
    get edit_equipe_perso_url(@equipe_perso)
    assert_response :success
  end

  test "should update equipe_perso" do
    patch equipe_perso_url(@equipe_perso), params: { equipe_perso: { argent: @equipe_perso.argent, effectif: @equipe_perso.effectif, nameteam: @equipe_perso.nameteam, nametrainer: @equipe_perso.nametrainer, pays: @equipe_perso.pays, statsgenerale: @equipe_perso.statsgenerale } }
    assert_redirected_to equipe_perso_url(@equipe_perso)
  end

  test "should destroy equipe_perso" do
    assert_difference('EquipePerso.count', -1) do
      delete equipe_perso_url(@equipe_perso)
    end

    assert_redirected_to equipe_persos_url
  end
end
