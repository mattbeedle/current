module Current

  def controller_is?(*attrs)
    attrs.collect{|attr| attr.to_s}.include?(controller_name)
  end
  alias :controller_is :controller_is?

  def action_is?(*attrs)
    attrs.map{|attr| attr.to_s}.include?(action_name)
  end
  alias :action_is :action_is?

  def partial_is?(param)
    param == params[:partial]
  end
  alias :partial_is :partial_is?

  def controller_action_is?(c,a)
    controller_is(c) && action_is(a)
  end
  alias :controller_action_is :controller_action_is?

  def active_if?(condition)
    condition ? "active" : "inactive"
  end
  alias :active_if :active_if?

  def nav_link_to(text,path,condition, options={})
    klass = active_if?(condition) + " #{options[:class]}"
    linktext = condition ? "#{text}" : text
    link_to(raw(linktext), path, options.merge(:class => klass.strip))
  end

end


ActionView::Base.send :include, Current