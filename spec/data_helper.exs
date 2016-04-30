defmodule DataHelper do

  def read(dataset) do
    "spec/resources/data/#{dataset}.dat"
    |> File.read!
    |> String.split("\n")
    |> Stream.drop_while(fn line -> line != "Data: Y" end)
    |> Stream.drop(2)
    |> parse_data
  end

  defp parse_data(lines) do
    lines
    |> Stream.map(fn line -> line |> String.strip |> Float.parse end)
    |> Stream.filter(fn x -> x != :error end)
    |> Stream.map(&elem(&1, 0))
  end

end