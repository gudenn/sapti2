$('#myContainer .item').on({
  click: function() {
    event.preventDefault();
    console.log('item clicked');
  },
  mouseenter: function() {
    console.log('enter!');
  }
});