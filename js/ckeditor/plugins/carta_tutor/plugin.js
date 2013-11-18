(function(){
  var a = {exec:function(editor){editor.insertHtml('[tutor]');}},
      b = 'carta_tutor';
  CKEDITOR.plugins.add(b,{
    init:function(editor){
      editor.addCommand(b,a);
      editor.ui.addButton("Tutor",{
          label:'Nombre del Tutor', 
          icon:this.path+"tutor.png",
          command:b
          });
    }
  });
})();