require 'rails_helper'

feature 'user does not see expired job' do

  scenario 'successfully' do
    c = Category.create(name:"cat")
    c2 = Company.create(name:"empresa", location:"SP", mail:"empresa@empresa", phone:"89898889")

    job = nil
    travel_to 90.days.ago do
      job = Job.create(title: "dev rails",
                       category: c,
                       company: c2,
                       description: "Nao pode ter preguica de escrever, tem que gostar =D",
                       location: "Na sua casa, fazemos Home Officeeeeeeeeeee")
    end

    visit root_path

    expect(page).not_to have_content job.title
    expect(page).to have_content 'Vaga Expirada'
  end
end
