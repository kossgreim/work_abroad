require 'rails_helper'

RSpec.describe "clients/edit", type: :view do
  before(:each) do
    @client = assign(:client, Client.create!(
      :first_name => "",
      :last_name => "",
      :email => "",
      :phone => "",
      :country => "",
      :city => "",
      :birthday => "",
      :occupation => "",
      :gender => false
    ))
  end

  it "renders the edit client form" do
    render

    assert_select "form[action=?][method=?]", client_path(@client), "post" do

      assert_select "input#client_first_name[name=?]", "client[first_name]"

      assert_select "input#client_last_name[name=?]", "client[last_name]"

      assert_select "input#client_email[name=?]", "client[email]"

      assert_select "input#client_phone[name=?]", "client[phone]"

      assert_select "input#client_country[name=?]", "client[country]"

      assert_select "input#client_city[name=?]", "client[city]"

      assert_select "input#client_birthday[name=?]", "client[birthday]"

      assert_select "input#client_occupation[name=?]", "client[occupation]"

      assert_select "input#client_gender[name=?]", "client[gender]"
    end
  end
end
