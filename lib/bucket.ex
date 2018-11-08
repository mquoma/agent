defmodule KV.Bucket do
  use Agent

  @doc """
  Bucket
  https://elixir-lang.org/getting-started/mix-otp/agent.html
  """

  def start_link() do
    Agent.start_link(fn -> %{} end)
  end

  def get(bucket, key) do
    bucket
    |> Agent.get(fn b -> Map.get(b, key) end)
  end

  def put(bucket, key, value) do
    bucket
    |> Agent.update(fn b -> Map.put(b, key, value) end)
  end
end
