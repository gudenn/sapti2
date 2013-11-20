(function(){
  var a = {exec:function(editor){editor.insertHtml('[director]');}},
      b = 'carta_director';
  CKEDITOR.plugins.add(b,{
    init:function(editor){
      editor.addCommand(b,a);
      editor.ui.addButton("Director",{
          label:'Nombre del Director de la Carrera', 
          icon:this.path+"director.png",
          command:b
          });
    }
  });
})();