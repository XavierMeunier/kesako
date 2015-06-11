module ApplicationHelper

  def add_child_button(name, association,target)
    content_tag(:div,"#{image_tag('/create.png', :border => 0, size: '15x15', alt: 'delete')} <span>#{name}</span>".html_safe,
      :class => "add_child",
      :"data-association" => association,
      :target => target)
  end

  def remove_child_button
    content_tag(:div,image_tag("/delete.png", :border => 0, size: "15x15", alt: "delete"),
      :class => "remove_child")
  end

  def new_fields_template(f,association,options={})
    options[:object]    ||= f.object.class.reflect_on_association(association).klass.new
    options[:partial]   ||= association.to_s.singularize + "_fields"
    options[:template]  ||= association.to_s + "_fields"
    options[:f]         ||= :f

    tmpl = f.fields_for(association,options[:object], :child_index => "new_#{association}") do |b|
      render(:partial=>options[:partial],:locals =>{:f => b})
    end
    
    tmpl = tmpl.gsub /(?<!\n)\n(?!\n)/, ' '
    return "<script> var #{options[:template]} = '#{tmpl.to_s}' </script>".html_safe
  end

end