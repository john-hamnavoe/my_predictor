class AutoSaveBuilder < ActionView::Helpers::FormBuilder
  # def check_box(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def collection_check_boxes(attribute, collection, value_method, text_method, options = {}, html_options = {}, &block)
  #   merge_data_controller(html_options)
  #   super(attribute, collection, value_method, text_method, options, html_options, &block)
  # end

  # def collection_radio_buttons(attribute, collection, value_method, text_method, options = {}, html_options = {}, &block)
  #   merge_data_controller(html_options)
  #   super(attribute, collection, value_method, text_method, options, html_options, &block)
  # end

  # def collection_select(attribute, collection, value_method, text_method, options = {}, html_options = {})
  #   merge_data_controller(html_options)
  #   super(attribute, collection, value_method, text_method, options, html_options)
  # end

  # def color_field(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def date_field(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def date_select(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def datetime_field(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def datetime_local_field(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def datetime_select(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def email_field(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def file_field(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def hidden_field(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def month_field(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  def number_field(attribute, options = {})
    merge_data_controller(options)
    super(attribute, options)
  end

  # def password_field(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def phone_field(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def range_field(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def radio_button(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def rich_text_area(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def search_field(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  def select(method, choices = nil, options = {}, html_options = {}, &block)
    merge_data_controller(html_options)
    super(method, choices, options, html_options, &block)
  end

  # def text_area(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def telephone_field(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def text_field(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def time_field(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def time_select(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def time_zone_select(attribute, priority_zones = nil, options = {}, html_options = {})
  #   merge_data_controller(html_options)
  #   super(attribute, priority_zones, options, html_options)
  # end

  # def url_field(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  # def week_field(attribute, options = {})
  #   merge_data_controller(options)
  #   super(attribute, options)
  # end

  private

  def merge_data_controller(options)
    return if @object.new_record?
    if options[:"data-controller"].present?
      options[:"data-controller"] = [options[:"data-controller"], "autosave"].join(" ")
    elsif options.dig(:data, :controller).present?
      options[:data][:controller] = [options.dig(:data, :controller), "autosave"].join(" ")
    else
      options[:"data-controller"] = "autosave"
    end
  end
end