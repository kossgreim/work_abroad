require 'rails_helper'

RSpec.describe "clients/index", type: :view do
  before(:each) do
    assign(:clients, [
      Client.create!(
        :first_name => "",
        :last_name => "",
        :email => "",
        :phone => "",
        :country => "",
        :city => "",
        :birthday => "",
        :occupation => "",
        :gender => false
      ),
      Client.create!(
        :first_name => "",
        :last_name => "",
        :email => "",
        :phone => "",
        :country => "",
        :city => "",
        :birthday => "",
        :occupation => "",
        :gender => false
      )
    ])
  end

  it "renders a list of clients" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
