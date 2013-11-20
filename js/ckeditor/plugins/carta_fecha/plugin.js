(function(){
  var a = {exec:function(editor){editor.insertHtml('[fecha]');}},
      b = 'carta_fecha';
  CKEDITOR.plugins.add(b,{
    init:function(editor){
      editor.addCommand(b,a);
      editor.ui.addButton("Fecha",{
          label:'Ingresa una fecha tipo: Cochabamba, 17 de Enero del 2015', 
          icon:this.path+"fecha.png",
          command:b
          });
    }
  });
})();