# frozen_string_literal: true

# ChangeNicknameEvent uses a Decidim::User as the resource, but User does
# not implement `mounted_engine`, which causes ResourceLocatorPresenter to blow
# up when the notification mailer template calls `resource_path`.
#
# Override resource_path and resource_url to point to the account settings page
# (consistent with the event's own i18n_options) so the email can be rendered.
Rails.application.config.to_prepare do
  Decidim::ChangeNicknameEvent.class_eval do
    def resource_path
      @resource_path ||= Decidim::Core::Engine.routes.url_helpers.account_path
    end

    def resource_url
      @resource_url ||= begin
        url_options = ActionMailer::Base.default_url_options.presence || Decidim::UrlOptionResolver.new.options
        Decidim::Core::Engine.routes.url_helpers.account_url(**url_options)
      rescue ArgumentError
        Decidim::Core::Engine.routes.url_helpers.account_path
      end
    end
  end
  
  # NotificationGeneratorForRecipientJob may receive a Decidim::UserGroup as
  # recipient (e.g. when fired via EventsManager with affected_users that include
  # groups), but Decidim::Notification only accepts Decidim::User. Skip silently.
  Decidim::NotificationGeneratorForRecipientJob.class_eval do
    def perform(event, event_class_name, resource, recipient, user_role, extra)
      return unless recipient.is_a?(Decidim::User)

      super
    end
  end
  
  # MeetingsMetricManage#save uses find_or_initialize_by + save! which raises
  # ActiveRecord::RecordInvalid when two workers race to create the same metric row.
  # Rescue and skip gracefully since the record is already persisted.
  Decidim::Meetings::Metrics::MeetingsMetricManage.class_eval do
    def save
      cumulative.each do |key, cumulative_value|
        next if cumulative_value.zero?

        quantity_value = quantity[key] || 0
        category_id, space_type, space_id = key
        record = Decidim::Metric.find_or_initialize_by(
          day: @day.to_s,
          metric_type: @metric_name,
          organization: @organization,
          decidim_category_id: category_id,
          participatory_space_type: space_type,
          participatory_space_id: space_id
        )
        record.assign_attributes(cumulative: cumulative_value, quantity: quantity_value)
        record.save!
      rescue ActiveRecord::RecordInvalid => e
        raise unless e.message.include?("Day has already been taken")
      end
    end
  end
end
