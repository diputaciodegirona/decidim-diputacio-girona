# frozen_string_literal: true

require "rails_helper"

RSpec.describe EphemeralFileAuthorizationHandler do
  subject(:handler) { described_class.new(params) }

  let(:params) { { user: user, id_document: "12345678A", birthdate: "1990-01-01" } }
  let(:organization) { create(:organization) }
  let(:user) { create(:user, organization: organization) }

  describe "#handler_name" do
    it "returns ephemeral_file_authorization_handler" do
      expect(handler.handler_name).to eq("ephemeral_file_authorization_handler")
    end
  end

  describe "#form_attributes" do
    it "includes id_document and birthdate" do
      expect(handler.form_attributes).to include("id_document", "birthdate")
    end

    it "excludes tos_agreement" do
      expect(handler.form_attributes).not_to include("tos_agreement")
    end

    it "excludes id and user" do
      expect(handler.form_attributes).not_to include("id", "user")
    end
  end

  it "inherits from FileAuthorizationHandler" do
    expect(described_class.superclass).to eq(FileAuthorizationHandler)
  end
end
