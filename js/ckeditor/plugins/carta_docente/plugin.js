(function(){
  var a = {exec:function(editor){editor.insertHtml('[docente]');}},
      b = 'carta_docente';
  CKEDITOR.plugins.add(b,{
    init:function(editor){
      editor.addCommand(b,a);
      editor.ui.addButton("Docente",{
          label:'Nombre del Docente', 
          icon:this.path+"docente.png",
          command:b
          });
    }
  });
})();