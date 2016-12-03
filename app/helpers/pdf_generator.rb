#Encoding: UTF-8
module PDFGenerator
  class Generator
    def self.get_pdf(model, view_name, file_name, print_footer = true)
      if File.exist?("#{Rails.root}/app/views/document_templates/#{view_name}.pdf")
      # Genera el documento llenando los formularios del template con informacion que contiene el model.
        PdfFillForm.fill_form(model, view_name, file_name)
        return {
          data: "public/pdf/#{file_name}.pdf"
        }
      end
    end
  end
end
