# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TestApp.Repo.insert!(%TestApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TestApp.Diary

Diary.create_user(%{name: "Anmol", age: 39, meta: "Brother"})
Diary.create_user(%{name: "Anmog", age: 38, meta: "Brother"})
Diary.create_user(%{name: "Anmoh", age: 37, meta: "Brother"})
Diary.create_user(%{name: "Anmoj", age: 37, meta: "Brother"})
Diary.create_user(%{name: "Anmok", age: 36, meta: "Brother"})
Diary.create_user(%{name: "Anmol", age: 35, meta: "Brother"})
Diary.create_user(%{name: "Anmon", age: 13, meta: "Brother"})
Diary.create_user(%{name: "Anmom", age: 10, meta: "Brother"})
Diary.create_user(%{name: "Anmok", age: 40, meta: "Brother"})
Diary.create_user(%{name: "Anmot", age: 50, meta: "Brother"})
Diary.create_user(%{name: "Anmow", age: 20, meta: "Brother"})
