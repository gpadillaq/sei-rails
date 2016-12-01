#Encoding: UTF-8
module FiltersHelper
  def filter(filter_field, filter_label, options={})
    filter_value = nil
    filter_predicate = nil
    filter_type = options[:as] || :text
    collection = options[:collection] || []
    match_criteria = options[:match_criteria]
    match_criteria ||= case filter_type
      when :select, :select_tag, :check_box
        "_eq"
      when :date_range, :custom_search_filter
        ""
      else
        "_cont"
    end
    filter_field = (filter_field.to_s + match_criteria).to_sym
    collection = [["Cualquiera", ""]] + collection if collection.present?
    if params[:q].present?
      if (value = params[:q][filter_field]).present?
        filter_value = value
      elsif (predicate = params[:q][filter_field.to_s + "_p"]).present?
        filter_predicate = predicate
        if (value = params[:q]["#{filter_field}_#{filter_predicate}"]).present?
          filter_value = value
        end
      end
    end
    render "filters/filter", field: filter_field, label: filter_label, filter_type: filter_type, collection: collection, f: options[:f], filter_value: filter_value, filter_predicate: filter_predicate
  end

  def scope(scope_field, scope_label, scope_value = nil, match_criteria = "_eq")
    scope_active = false

    if scope_field == :all
      scope_params = {}
    else
      scope_field = (scope_field + match_criteria)
      scope_params = {scope_field => scope_value}
      if params[:q].present?
        params_q = params[:q].clone
        if params_q[scope_field] == scope_value.to_s
          scope_active = true
          params_q.delete scope_field
          scope_params = {}
        end
        scope_params = params_q.merge(scope_params)
      end
    end
    scope_url = url_for(:only_path=>false, :utf8 => "✓", :q => scope_params)

    link_to(scope_label, scope_url, class: "scope button #{scope_active ? 'scope-active' : ''}")
  end

  def action(action_field, action_label, controller, format = nil)
    link_to(action_label, url_for(controller: controller, format: format, action: action_field, params: params),
            class: "black button")
  end

  def options_for_predicate_select(value = nil)
    options_for_select(%w( eq lt lteq gt gteq ).map{|p| [I18n.t("ransack.predicates.#{p}"), p]}, value)
  end

  def collection_for_month_filter
    (1..12).map{|month| [I18n.t("date.month_names")[month], month.to_d]}
  end
end
