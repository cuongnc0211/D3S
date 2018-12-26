module ApplicationHelper
  FLASH_TYPE = {
    success: 'alert-successed', failed: 'alert-failed', error: 'alert-failed',
    notice: 'alert-successed', alert: 'alert-info'
  }

 # def full_title(page_title = '')
 #    return t('app_name') if page_title.blank?
 #    "#{page_title} | #{t('app_name')}"
 #  end

	def full_title(page_title = '')
    return "D3S" if page_title.blank?
    "Page | D3S"
  end

  def flash_class flash_type
    FLASH_TYPE[flash_type] || flash_type.to_s
  end

  def show_field_error form, attribute
    error_field = <<-HTML
      <div class="md-input-message-animation">
        #{t('activerecord.errors.models')[form.object.class.name.downcase
          .to_sym][:attributes][attribute]} #{form.object.errors[attribute].first}
      </div>
    HTML
    error_field.html_safe if form.object.errors[attribute].present?
  end   
end
