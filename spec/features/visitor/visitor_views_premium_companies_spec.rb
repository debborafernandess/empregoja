require 'rails_helper'

feature 'Visitor view premium companies' do
  scenario 'successfully' do

    company = Company.create(name: 'Campus Code',
                   location: 'São Paulo',
                   phone: '11 2369 3476',
                   mail: 'contato@campuscode.com.br')

    5.times do
      create_job(company)
    end

    visit root_path

    expect(page).to have_content('Empresa Premium')
  end


  scenario 'company have more than 5 jobs' do

   company = create_company

    20.times do
      create_job(company)
    end

    visit root_path

    expect(page).to have_content('Empresa Premium')
end



  scenario 'company is not premium' do

   company = create_company

   create_job(company)

   visit root_path

   expect(page).not_to have_content("Empresa Premium")
  end
end
