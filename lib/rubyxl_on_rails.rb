module RubyXLonRails

  def self.render_xlsx_string(spreadsheet)
<<RENDER
    #{spreadsheet}
    blob = StringIO.new
    FileUtils.copy_stream workbook.stream, blob
    blob.string
RENDER
  end

end

# Setups the template handling
require "action_view/template"
ActionView::Template.register_template_handler :rxlsx, lambda { |template|
  RubyXLonRails.render_xlsx_string(template.source)
}

# Adds support for `format.xlsx`
require "action_controller"
require 'rubyXL'
Mime::Type.register "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", :xlsx

ActionController::Renderers.add :xlsx do |filename, options|
  puts options.inspect
  send_data(render_to_string(options), :filename => "#{filename}.xlsx", :type => "application/xlsx", :disposition => "attachment")
end
