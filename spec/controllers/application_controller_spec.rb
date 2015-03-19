require 'rails_helper'

describe ApplicationController do

  controller do
    def index
      routing_error
    end

    def unknown_error
      raise 'error'
    end

    def not_found_error
      raise ActiveRecord::RecordNotFound.new
    end
  end

  describe 'render_500' do
    before { routes.draw { get "anonymous/unknown_error" } }
    it "returns 500" do
      get :unknown_error
      expect(response.status).to eq(500)
    end
  end

  describe '#render_404' do
    before { routes.draw { get "anonymous/not_found_error" } }
    it "returns 404" do
      get :not_found_error
      expect(response.status).to eq(404)
    end
  end

  describe "invoke routing_error" do
    it "returns 404" do
      get :index
      expect(response.status).to eq(404)
    end
  end

end
