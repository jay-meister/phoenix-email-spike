defmodule SpikeEmail.EmailTest do
  use ExUnit.Case
  use Bamboo.Test

  # unit test the email function
  test "welcome email" do

    email = EmailSpike.Email.welcome_text_email("jmurphy.web@gmail.com")
    assert email.to == "jmurphy.web@gmail.com"
    assert email.subject == "Welcome!"
    assert email.text_body =~ "ello"
  end


  use EmailSpike.ConnCase
  test "email sent after / route hit" do
    get build_conn(), "/"
    assert_delivered_email EmailSpike.Email.welcome_text_email("jmurphy.web@gmail.com")
  end
end
