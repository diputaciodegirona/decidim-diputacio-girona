# frozen_string_literal: true

require 'rails_helper'

describe 'Visit the home page', type: :system, perform_enqueued: true do
  before do
    organization = create :organization
    create :content_block, organization: organization, scope_name: :homepage, manifest_name: :hero
    create :content_block, organization: organization, scope_name: :homepage, manifest_name: :sub_hero

    switch_to_host(organization.host)
  end

  it 'renders the home page' do
    visit decidim.root_path(locale: :en)
    expect(page).to have_content('Welcome')
  end
end
