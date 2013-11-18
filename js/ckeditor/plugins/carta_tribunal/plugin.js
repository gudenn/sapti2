(function(){
  var a = {exec:function(editor){editor.insertHtml('[tribunal]');}},
      b = 'carta_tribunal';
  CKEDITOR.plugins.add(b,{
    init:function(editor){
      editor.addCommand(b,a);
      editor.ui.addButton("Tribunal",{
          label:'Nombre del Tribunal', 
          icon:this.path+"tribunal.png",
          command:b
          });
    }
  });
})();