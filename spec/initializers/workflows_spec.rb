# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Workflows initializer" do
  subject(:manifest) { Decidim::Verifications.find_workflow_manifest(:ephemeral_file_authorization_handler) }

  it "registers the ephemeral_file_authorization_handler workflow" do
    expect(manifest).not_to be_nil
  end

  it "is configured as ephemeral" do
    expect(manifest.ephemeral).to be true
  end

  it "uses EphemeralFileAuthorizationHandler as the form" do
    expect(manifest.form).to eq("EphemeralFileAuthorizationHandler")
  end

  it "expires in 1 month" do
    expect(manifest.expires_in).to eq(1.month)
  end

  it "is not renewable" do
    expect(manifest.renewable).to be false
  end

  it "has a time_between_renewals of 5 minutes" do
    expect(manifest.time_between_renewals).to eq(5.minutes)
  end
end
