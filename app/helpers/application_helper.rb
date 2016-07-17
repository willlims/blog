module ApplicationHelper
  def ckeditor(obj,field,config={})
    local_config = ""
    config.reject{|k,v| k == :text}.each do |key,value|
      _value=value
      #宽度可以设置百分比
      if key=='width'.to_sym
        if value.class.to_s=='String'&&value.index('%')
          percent = value.split('%')[0].to_i
          _value="document.body.scrollWidth *#{percent}*0.01"
        end
      end
      local_config+="CKEDITOR.config.#{key.to_s}=#{_value}; \n "
    end

    javascript_include_tag("/javascripts/ckeditor_full/ckeditor.js")+
        "<script>var ck_tag_name='#{obj}[#{field}]'</script>"+
        "<textarea cols='100' id='#{obj}[#{field}]' name='#{obj}[#{field}]' rows='20'></textarea>"+
        javascript_include_tag("/javascripts/ckeditor/ck_textarea.js")+
        javascript_include_tag("/javascripts/ckeditor/ck_head.js")+
        "<script>#{local_config}
      window.onload=function(){
        editor_obj = CKEDITOR.instances[ck_tag_name]
        editor_obj.setData('"+config[:text].to_s+"');
      }
    </script>"
  end
end
