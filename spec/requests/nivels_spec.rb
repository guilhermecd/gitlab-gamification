require 'rails_helper'

RSpec.describe "Nivels", type: :request do
  describe "GET /nivels" do
    it "works! (now write some real specs)" do
      get nivels_path
      expect(response).to have_http_status(200)
    end
  end
end
