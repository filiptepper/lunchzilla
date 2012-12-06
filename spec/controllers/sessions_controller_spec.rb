require 'spec_helper'

describe SessionsController do
  describe 'GET failure' do
    before :each do
      get :failure
    end

    it { should respond_with(:redirect) }
    it { should redirect_to(root_path) }
    it 'sets flash :notice' do
      flash[:notice].should == 'Something went wrong. :( Please try again.'
    end
  end
end