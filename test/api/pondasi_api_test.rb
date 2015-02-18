require "test_helper"

class Pondasi::APITest < ActiveSupport::TestCase
  include Rack::Test::Methods

  def app
    Rails.application
  end

  def setup
    Post.destroy_all
  end

  def teardown
    Post.destroy_all
  end

  test "show posts should return empty" do
    get "/api/posts"
    assert last_response.ok?
    assert_equal JSON.parse(last_response.body), []
  end

  test "show a post" do
    the_post = Post.create!(title: "Some title")
    get "/api/posts/#{the_post.id}"
    assert_equal last_response.body, the_post.to_json
  end

  test "create a post" do
    post "/api/posts", title: "Some title"
    assert_equal Post.last.title, "Some title"
  end

  test "update a post" do
    the_post = Post.create!(title: "Some title")
    patch "/api/posts/#{the_post.id}", title: "New title"
    assert_equal Post.last.title, "New title"
  end

  test "delete a post" do
    the_post = Post.create!(title: "Some title")
    delete "/api/posts/#{the_post.id}"
    assert_equal Post.last, nil
  end
end
