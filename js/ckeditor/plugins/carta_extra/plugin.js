(function(){
  var a = {exec:function(editor){editor.insertHtml('[extra]');}},
      b = 'carta_extra';
  CKEDITOR.plugins.add(b,{
    init:function(editor){
      editor.addCommand(b,a);
      editor.ui.addButton("Extra",{
          label:'Inserta un Campo para Configurar Antes de la Impresi&oacute;n', 
          icon:this.path+"extra.png",
          command:b
          });
    }
  });
})();