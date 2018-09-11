class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  should 'should get index' do
    get root_path
    assert_response :success
  end

  should 'validate asin' do
    post check_asin_path params: { asin: '1455586692' }
    assert_response :success
  end
end