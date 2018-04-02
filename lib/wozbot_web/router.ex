defmodule WozbotWeb.Router do
  use WozbotWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WozbotWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
   scope "/api", WozbotWeb do
     pipe_through :api

     get "/quotes/random", QuoteController, :random
     get "/quotes", QuoteController, :index
   end
end
