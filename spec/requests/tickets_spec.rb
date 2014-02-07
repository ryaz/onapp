require 'spec_helper'

describe "Tickets" do
  describe "GET /" do
    it "it shows new ticket form" do
      get '/'
      response.status.should be(200)
    end
  end
end
