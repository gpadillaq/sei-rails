require "#{Rails.root}/config/pdf_configurator.rb"
class PdfFillForm
  extend PdfConfigurator
  def self.fill_form(model, view_name, file_name)
    document = self.get_template(model, view_name)
    Prawn::Document.generate "public/pdf/#{file_name}.pdf", template: document[:template] do |pdf|
      pdf.fill_form_with(document[:data])
    end
  end
end
