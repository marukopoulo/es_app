ActiveAdmin.register Entry do
permit_params :user_id, :content


index do
    selectable_column

    column :id do |entry|
      link_to entry.id, admin_entry_path(entry)
    end
    column :content
    column :user do |entry|
      if entry.user.present?
        link_to entry.user.name, admin_user_path(entry.user)
      else
        status_tag('Empty')
      end
    end
  end

end
