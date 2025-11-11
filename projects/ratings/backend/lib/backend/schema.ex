defmodule Backend.Schema do
  use Absinthe.Schema

  def context(ctx) do
    with {:ok, current_user} <- Guardian.Plug.current_resource(ctx) do
      Map.put(ctx, :current_user, current_user)
    else
      _ -> ctx
    end
  end

  query do
    @desc "Get a list of users"
    field :users, list_of(:user) do
      middleware Backend.Plugs.Auth
      resolve &Backend.Accounts.UserResolver.all/3
    end

    @desc "Ping the server"
    field :ping, :string do
      resolve fn _, _ -> {:ok, "pong"} end
    end
  end

  mutation do
    @desc "Create a user"
    field :create_user, :user do
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      resolve &Backend.Accounts.UserResolver.create/3
    end

    @desc "Sign in a user"
    field :login, :string do
      arg :email, non_null(:string)
      arg :password, non_null(:string)
      resolve &Backend.Accounts.UserResolver.sign_in/3
    end
  end

  object :user do
    field :id, :id
    field :email, :string
  end
end
