require 'test_helper'

class TaxRangesControllerTest < ActionController::TestCase
  setup do
    @tax_range = tax_ranges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tax_ranges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tax_range" do
    assert_difference('TaxRange.count') do
      post :create, tax_range: { income_max: @tax_range.income_max, income_min: @tax_range.income_min, rate: @tax_range.rate, tax_from_lower_range: @tax_range.tax_from_lower_range }
    end

    assert_redirected_to tax_range_path(assigns(:tax_range))
  end

  test "should show tax_range" do
    get :show, id: @tax_range
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tax_range
    assert_response :success
  end

  test "should update tax_range" do
    patch :update, id: @tax_range, tax_range: { income_max: @tax_range.income_max, income_min: @tax_range.income_min, rate: @tax_range.rate, tax_from_lower_range: @tax_range.tax_from_lower_range }
    assert_redirected_to tax_range_path(assigns(:tax_range))
  end

  test "should destroy tax_range" do
    assert_difference('TaxRange.count', -1) do
      delete :destroy, id: @tax_range
    end

    assert_redirected_to tax_ranges_path
  end
end
