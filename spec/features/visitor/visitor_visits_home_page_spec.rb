require 'rails_helper'

feature 'Visitor visits Emprego Ja home page' do
  scenario 'successfully' do
    visit root_path
    expect(page).to have_css :h1, 'Emprego Já'
    expect(page).to have_css :h3, 'Quem Somos'
    expect(page).to have_css :p, 'Somos a ferramenta que faltava para você encontrar seu novo emprego!'
  end
end
