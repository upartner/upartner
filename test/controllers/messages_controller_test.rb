require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  
  #テストデータ定義
  setup do
    @message = messages(:one)
    @message2 = messages(:two)
  end

  #indexのgetメソッドが正常に実行できること（取得したmessagesがnilでないこと）
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:messages)
  end

  #newのgetメソッドが正常に実行できること（ステータスコードがsuccessであること）
  test "should get new" do
    get :new
    assert_response :success
  end

  #showのgetメソッドが正常に実行できること（ステータスコードがsuccessであること）
  test "should show message" do
    get :show, id: @message
    assert_response :success
  end

  #editのgetメソッドが正常に実行できること（ステータスコードがsuccessであること）
    test "should get edit" do
    get :edit, id: @message
    assert_response :success
  end

  #createのpostメソッドが正常に実行できること
  test "should create message" do
    assert_difference('Message.count') do
      post :create, message: {user_id: @message.user_id,
                              title: @message.title, 
                              message: @message.message, 
                              image_url: @message.image_url }
    end
    assert_redirected_to message_path(assigns(:message))
  end

  #updateが正常に実行できること
  test "should update message" do
    patch :update, id: @message2, message: { user_id: @message.user_id,
                                            title: @message.title,
                                            message: @message.message, 
                                            image_url: @message.image_url }
    assert_redirected_to message_path(assigns(:message))
  end

  #destroyのdeleteメソッドが正常に実行できること
  test "should destroy message" do
    assert_difference('Message.count', -1) do
      delete :destroy, id: @message
    end

    assert_redirected_to messages_path
  end
end
