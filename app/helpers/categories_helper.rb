module CategoriesHelper

  def grouped_options(id)
    puts id
    html = ''
    Category.where(depth: 0).sort.each{|cat| html += yyy(cat, id) }
    html.html_safe
  end

  private

  # def childrens c
  #   if c.children.present?
  #     c.children.map{|child| [child.name, "#{child.id}"]}
  #   else
  #     "#{c.id}"
  #   end
  # end

  def yyy(c, id)
    if c.children.present?
      cc = ''
      c.children.each {|child| cc += "<option value='#{child.id}' #{ child.id.to_i == id.to_i ? 'selected=selected' : '' }>#{child.name}</option>" }
      "<optgroup label='#{c.name}'>#{cc}</optgroup>"

    else
      "<option value='#{c.id}' #{c.id.to_i == id.to_i ? 'selected=selected' : ''}>#{c.name}</option>"
    end

  end

end
