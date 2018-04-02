defmodule WozbotWeb.PageController do
  use WozbotWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
