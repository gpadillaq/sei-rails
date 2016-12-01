SEI.Views.Subject = Backbone.View.extend({
  el: 'body',
  template: JST['templates/subject/import'],
  events: {
    'click button#import-subject': 'openModal',
    'click input#import-file-subject-btn': 'subjectImport'
  },
  openModal: function (event) {
    var target = $(event.target), modal_selector = 'modal-import-subject';
    if ($(['#', modal_selector].join('')).exists()) {
      $('div.flashes').remove();
      $('#import-file').val('');
      $('#errors-show-panel').empty();
    } else {
      this.$el.prepend(this.template());
    }
    $(['#', modal_selector].join('')).foundation('reveal', 'open');
  },
  subjectImport: function(event) {
    if (jQuery.isEmptyObject($('#import-file')[0].files[0])) {
      alert('Debe seleccionar un archivo.');
    } else {
      // $('div.spinner').removeClass('ocultarItem');
      var frmData = new FormData();
      frmData.append('file', $('#import-file')[0].files[0]);
      $.ajax({
        url: 'subjects/import',
        type: 'POST',
        cache: false,
        contentType: false,
        processData: false,
        data: frmData
      }).done(function(data) {
        console.log('success');
      }).fail(function(data) {
        $('#errors-show-panel').empty();
        $('#errors-show-panel').append('ERRORES ENCONTRADOS EN LOS SIGUIENTES DATOS:');
        $('#errors-show-panel').append(JSON.parse(data.responseText).msg);
      });
    }
  }
});

$(document).ready(function(){
  new SEI.Views.Subject();
});
