(function(){
  var a = {exec:function(editor){editor.insertHtml('[responsable]');}},
      b = 'carta_responsable';
  CKEDITOR.plugins.add(b,{
    init:function(editor){
      editor.addCommand(b,a);
      editor.ui.addButton("Responsable",{
          label:'Nombre del Responsable del Proyecto', 
          icon:this.path+"responsable.png",
          command:b
          });
    }
  });
})();