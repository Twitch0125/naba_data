defmodule Backend.Accounts.UserResolver do
  def all(_, _, _) do
    {:ok, Backend.Repo.all(Backend.Accounts.User)}
  end

  def create(_, %{email: email, password: password}, _) do
    changeset =
      %Backend.Accounts.User{}
      |> Backend.Accounts.User.changeset(%{email: email, password_hash: Bcrypt.hash_pwd_salt(password)})

    case Backend.Repo.insert(changeset) do
      {:ok, user} -> {:ok, user}
      {:error, changeset} -> {:error, changeset}
    end
  end

  def sign_in(_, %{email: email, password: password}, _) do
    case Backend.Repo.get_by(Backend.Accounts.User, email: email) do
      nil ->
        {:error, "Invalid email or password"}

      user ->
        if Bcrypt.verify_pass(password, user.password_hash) do
          case Backend.Guardian.encode_and_sign(user) do
            {:ok, token, _claims} -> {:ok, token}
            {:error, reason} -> {:error, reason}
          end
        else
          {:error, "Invalid email or password"}
        end
    end
  end
end
