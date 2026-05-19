# frozen_string_literal: true

# Enable Ephemeral Verification
Decidim::Verifications.register_workflow(:ephemeral_authorization_handler) do |workflow|
  workflow.ephemeral = true
  workflow.form = "FileAuthorizationHandler"
  # workflow.action_authorizer = "DefaultActionAuthorizer"
  workflow.expires_in = 1.month
  workflow.renewable = false
  workflow.time_between_renewals = 5.minutes
end
