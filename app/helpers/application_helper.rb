module ApplicationHelper
  def convert_flash_key(key)
    case key
    when 'alert'
      'danger'
    when 'notice'
      'info'
    else
      key
    end
  end
end
