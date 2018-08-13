require 'rails_helper'

context 'user visits root path' do
  it 'should say hello' do
    visit '/'

    expect(page).to have_content("Hello World")
  end
end