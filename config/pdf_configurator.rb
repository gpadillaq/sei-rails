module PdfConfigurator
  def get_template(model, view_name)
    if File.exist?("#{Rails.root}/app/views/document_templates/#{view_name}.pdf")
      template = "#{Rails.root}/app/views/document_templates/#{view_name}.pdf"
    end
    #obtener los datos
    data = DataPdfSetting.new
    return {
      template: template,
      data: data.send(view_name, model)
    }
  end
end
