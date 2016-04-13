require 'rails_helper'

feature 'User creates a new job' do
  before(:example) do
    @mandatory = ['Title', 'Category', 'Description', 'Location']
    @company = Company.create(name: 'Campus Code',
                            location: 'São Paulo',
                            mail: 'contato@campus.com.br',
                            phone: '2369-3476')
    @job = Job.new(title: 'Dev Master',
                  location: 'Rio de Janeiro',
                  category: 'Desenvolvedor',
                  description: 'Vaga para Dev Master para Bootcamp Rails')
  end

  scenario 'successfully' do
    visit new_job_path

    @mandatory.each do |field|
      fill_in field, with: @job.send(field.downcase)
    end
    select @company.name,   from: 'Company'

    click_on 'Criar Vaga'

    expect(page).to have_content @job.title
    expect(page).to have_content @job.location
    expect(page).to have_content @job.category
    expect(page).to have_content @company.name
    expect(page).to have_content @job.description
  end

  scenario 'featured job' do
    visit new_job_path

    @mandatory.each do |field|
      fill_in field, with: @job.send(field.downcase)
    end
    select @company.name,   from: 'Company'
    check   'Featured'

    click_on 'Criar Vaga'

    # within('div.job') do
      expect(page).to have_content @job.title
      expect(page).to have_content @job.location
      expect(page).to have_content @job.category
      expect(page).to have_content @company.name
      expect(page).to have_content @job.description
      expect(page).to have_content 'Vaga em Destaque'
    # end
  end

  scenario 'invalid data' do
    visit new_job_path

    click_on 'Criar Vaga'

    (@mandatory << 'Company').each do |field|
      expect(page).to have_content "#{field} can\'t be blank"
    end
  end
end
