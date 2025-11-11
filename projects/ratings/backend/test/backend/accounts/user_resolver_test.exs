defmodule Backend.Accounts.UserResolverTest do
  use Backend.DataCase
  alias Backend.Accounts.UserResolver

  describe "create_user/3" do
    test "creates a user" do
      {:ok, user} = UserResolver.create(nil, %{email: "test@example.com", password: "password"}, nil)
      assert user.email == "test@example.com"
    end
  end

  describe "sign_in/3" do
    setup do
      {:ok, user} = UserResolver.create(nil, %{email: "test@example.com", password: "password"}, nil)
      %{user: user}
    end

    test "signs in a user", %{user: user} do
      {:ok, token} = UserResolver.sign_in(nil, %{email: user.email, password: "password"}, nil)
      assert {:ok, %{"sub" => sub}} = Backend.Guardian.decode_and_verify(token)
      assert sub == to_string(user.id)
    end
  end

  describe "users/3" do
    test "returns a list of users when authenticated" do
      {:ok, users} = UserResolver.all(nil, nil, nil)
      assert length(users) == 0
    end
  end
end
