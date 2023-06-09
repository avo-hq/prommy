class Avo::Actions::ToggleInactive < Avo::BaseAction
  self.name = "Toggle inactive"

  def fields
    field :notify_user, as: :boolean, default: true
    field :message, as: :text, default: "Your account has been marked as inactive."
    field :user_id,
    as: :tags,
    mode: :select,
    close_on_select: true,
    visible: -> (resource:) { model.present? },
    fetch_values_from: -> { "/admin/resources/users/get_users?hey=you&record_id=#{resource.record.id}" },
    suggestions: -> do
      User.take(5).map do |user|
        {
          value: user.id,
          label: user.name
        }
      end
    end
  end

  def handle(**args)
    records, fields, _ = args.values_at(:records, :fields, :current_user, :resource)

    records.each do |record|
      if record.active
        record.update active: false
      else
        record.update active: true
      end

      record.notify fields[:message] if fields[:notify_user]
    end

    silent
  end
end
