// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("jquery")
require("popper.js")
require("@popperjs/core")
require("bootstrap")
require("channels")
require("trix")
require("@rails/actiontext")
require("chartkick")
require("chart.js")
require("jquery-ui-dist/jquery-ui")
require("selectize")
// require("@fortawesome/fontawesome-free/css/all")
import "@fortawesome/fontawesome-free/css/all"

import "chartkick/chart.js"
import "../trix-editor-overrides"
import "youtube"
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

$(document).on('turbolinks:load', function() {
  $('.lesson-sortable').sortable({
    cursor: "grabbing",
    cursorAt: { left: 10 },
    update: function(e, ui){
      let item = ui.item;
      let item_data = item.data();
      let params = {method: 'put'};
      params[item_data.modelName] = { row_order_position: item.index() }
      $.ajax({
          type: 'POST',
          url: item_data.updateUrl,
          dataType: 'json',
          data: params
      });
    },
    stop: function(e, ui){
      console.log("stop called when finishing sort of cards")
    }
  });

$("video").bind(contextmenu, function() {
  return false;
})

if ($('.selectize')){
  $('.selectize').selectize({
    sortField: 'text'
  });
}

});