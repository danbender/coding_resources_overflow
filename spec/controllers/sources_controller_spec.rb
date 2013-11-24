require 'spec_helper'

describe SourcesController do
  let(:params){
    {source: { title: "Hi, I am a title", url: "http://www.google.com" }}
  }

  describe "#create" do
    it "should create a new instance of source and save it in the database" do
      expect {
        post :create, params
      }.to change(Source, :count).by(1)
    end
  end

end