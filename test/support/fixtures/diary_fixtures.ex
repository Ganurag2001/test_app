defmodule TestApp.DiaryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TestApp.Diary` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        age: 42,
        meta: "some meta",
        name: "some name"
      })
      |> TestApp.Diary.create_user()

    user
  end
end
