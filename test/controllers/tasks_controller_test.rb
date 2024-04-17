require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @task = tasks(:one)
    sign_in @user 
  end

  test "should get index" do
    get tasks_url
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { title: 'Test Task', body: 'Test Body', user_id: @user.id } }
    end

    assert_redirected_to task_url(Task.last)
    assert_equal 'Task was successfully created.', flash[:notice]
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { title: 'Updated Title', body: 'Updated Body' } }
    assert_redirected_to task_url(@task)
    assert_equal 'Task was successfully updated.', flash[:notice]
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
    assert_equal 'Task was successfully destroyed.', flash[:notice]
  end

  test "should redirect to index if task not found on set_task" do
    get task_url(id: -1) # Using an ID that does not exist
    assert_redirected_to tasks_url
    assert_equal 'Task not found.', flash[:notice]
  end

  test "should handle unsuccessful destroy" do
    Task.any_instance.stubs(:destroy).returns(false)
    
    delete task_url(@task)
    assert_redirected_to tasks_url
    assert_equal 'Task was not successfully destroyed.', flash[:notice]
  end
end
