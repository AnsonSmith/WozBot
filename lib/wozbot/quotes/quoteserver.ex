defmodule Wozbot.Quotes.QuoteServer do
alias Wozbot.Quotes.Quote

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def random_quote() do
    {:ok, qte} = GenServer.call(__MODULE__, :random_quote)
    qte
  end

  def all_quotes() do
   {:ok, quotes} = GenServer.call(__MODULE__, :all_quotes)
   quotes
  end

  def init([]) do
    Process.send_after(self(), :load_quotes, 0)
    {:ok, []}
  end

  def handle_call(:random_quote, _from, quotes) do
    {:reply, {:ok, Enum.random(quotes)}, quotes}
  end

 def handle_call(:all_quotes, _from, quotes) do
    {:reply, {:ok, quotes}, quotes}
  end

  def handle_info(:load_quotes, _state) do
    {:noreply, read_quotes_file()}
  end


  defp read_quotes_file() do
    :code.priv_dir(:wozbot) ++ '/quotes.txt'
    |> File.stream!()
    |> Enum.to_list
    |> Enum.map(fn(x) -> line_to_quote(String.split(x, "\t")) end )

  end

  defp line_to_quote([progquote, author]) do
    %Quote{quotation: trim_data(progquote), author: trim_data(author)}
  end
  defp line_to_quote(_other) do
    :invalid
  end

  defp trim_data(data) do
    data
    |> String.trim("\"")
    |> String.trim("\n")
  end

end
