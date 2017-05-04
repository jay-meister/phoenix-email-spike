defmodule EmailSpike.Email do
  use Bamboo.Phoenix, view: EmailSpike.EmailView

  def welcome_text_email(email_address) do
    new_email
    |> to(email_address)
    |> from("jmurphy.web@gmail.com")
    |> subject("Welcome!")
    |> text_body("Hello")
  end
end
