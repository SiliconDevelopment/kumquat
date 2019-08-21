class RmdTemplateHandler
  class_attribute :default_format
  self.default_format = Mime[:html]

  def self.call(template)
    details = {
      :locals => template.locals,
      :virtual_path => template.virtual_path,
      :updated_at => template.updated_at
      }
 
      updated_source = template.source
      new_template = ActionView::Template.new(updated_source, template.identifier, template.handler, details)
      
      oo = ActionView::Template::Handlers::ERB.call(new_template)

      return "Knit2HTML.new(begin;#{oo};end).knit.html_safe"
  end

  def self.output_buffer
    nil
  end
end
