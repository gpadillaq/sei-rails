SEI.Views.User = Backbone.View.extend({
  el: 'body',
  template: JST['templates/user/import'],
  events: {
    'click button#import': 'openModal',
    'click input#import-file-btn': 'userImport'
  },
  openModal: function (event) {
    var target = $(event.target), modal_selector = 'modal-import';
    if ($(['#', modal_selector].join('')).exists()) {
      $('div.flashes').remove();
      $('#import-file').val('');
    } else {
      this.$el.prepend(this.template());
    }
    $(['#', modal_selector].join('')).foundation('reveal', 'open');
  },
  userImport: function(event) {
    if (jQuery.isEmptyObject($('#import-file')[0].files[0])) {
      RubyLedger.Collections.errors.add([{el: '#errors-show-panel', msg: 'Debe seleccionar un archivo.'}]);
    } else {
      // $('div.spinner').removeClass('ocultarItem');
      var frmData = new FormData();
      frmData.append('file', $('#import-file')[0].files[0]);
      $.ajax({
        url: 'users/import',
        type: 'POST',
        cache: false,
        contentType: false,
        processData: false,
        data: frmData
      }).done(function(data) {
        console.log('success');
      }).fail(function(data) {
        // $('div.spinner').addClass('ocultarItem');
        RubyLedger.Collections.errors.add([{el: '#errors-show-panel', msg: JSON.parse(data.responseText).msg}]);
      });
    }
  }
});

$(document).ready(function(){
  new SEI.Views.User();
});
