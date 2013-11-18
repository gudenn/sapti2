(function(){
  var a = {exec:function(editor){editor.insertHtml('[proyecto]');}},
      b = 'carta_proyecto';
  CKEDITOR.plugins.add(b,{
    init:function(editor){
      editor.addCommand(b,a);
      editor.ui.addButton("Proyecto",{
          label:'Nombre del Proyecto', 
          icon:this.path+"proyecto.png",
          command:b
          });
    }
  });
})();