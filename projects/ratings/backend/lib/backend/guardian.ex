defmodule Backend.Guardian do
  use Guardian, otp_app: :backend

  def subject_for_token(%{id: id}, _claims) do
    sub = to_string(id)
    {:ok, sub}
  end

  def resource_from_claims(%{"sub" => id}) do
    resource = Backend.Repo.get(Backend.Accounts.User, id)
    {:ok, resource}
  end
end
