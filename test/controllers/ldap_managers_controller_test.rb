require 'test_helper'

class LdapManagersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ldap_manager = ldap_managers(:one)
  end

  test "should get index" do
    get ldap_managers_url
    assert_response :success
  end

  test "should get new" do
    get new_ldap_manager_url
    assert_response :success
  end

  test "should create ldap_manager" do
    assert_difference('LdapManager.count') do
      post ldap_managers_url, params: { ldap_manager: {  } }
    end

    assert_redirected_to ldap_manager_url(LdapManager.last)
  end

  test "should show ldap_manager" do
    get ldap_manager_url(@ldap_manager)
    assert_response :success
  end

  test "should get edit" do
    get edit_ldap_manager_url(@ldap_manager)
    assert_response :success
  end

  test "should update ldap_manager" do
    patch ldap_manager_url(@ldap_manager), params: { ldap_manager: {  } }
    assert_redirected_to ldap_manager_url(@ldap_manager)
  end

  test "should destroy ldap_manager" do
    assert_difference('LdapManager.count', -1) do
      delete ldap_manager_url(@ldap_manager)
    end

    assert_redirected_to ldap_managers_url
  end
end
