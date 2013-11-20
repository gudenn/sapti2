(function(){
  var a = {exec:function(editor){editor.insertHtml('[estudiante]');}},
      b = 'carta_estudiante';
  CKEDITOR.plugins.add(b,{
    init:function(editor){
      editor.addCommand(b,a);
      editor.ui.addButton("Estudiante",{
          label:'Nombre del Estudiante', 
          icon:this.path+"estudiante.png",
          command:b
          });
    }
  });
})();