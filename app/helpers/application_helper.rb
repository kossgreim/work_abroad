module ApplicationHelper
  def replace_flash_key(key)
    {alert: 'danger', notice: 'info'}[key.to_sym] || key
  end

  def user_assigned_roles(user=nil)
    user ||= current_user
    user.roles.collect(&:name).join(', ')
  end

  def user_full_name(user)
    "#{user.first_name} #{user.last_name}"
  end
end
