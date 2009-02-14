class MyFieldsWantToExpressThemselvesGenerator < Rails::Generator::NamedBase
   attr_accessor :with_class, :checkbox_height, :radio_height, :select_width, :images_path
   
   def initialize(*runtime_args)
      super(*runtime_args)
      @with_class ||= "with_flair"
      @checkbox_height ||= 25
      @radio_height ||= 25
      @select_width ||= 190
      @images_path ||= "public/images/form_elements_with_flair"
   end
   
   def manifest
      environment_contents = File.open("config/environment.rb","r").read
      File.open("config/environment.rb","w") { |f| f.write(environment_contents << "\n\nFLAIR_CLASS = \"#{@with_class}\"") }
      
      dir = File.join(RAILS_ROOT, @images_path)
      Dir.mkdir(dir) unless File.directory?(dir)
      
      generate_files = record do |m|
         m.template 'custom-form-elements.js', 'public/javascripts/custom-form-elements.js'
         m.file "checkbox.gif", "#{@images_path}/checkbox.gif"
         m.file "radio.gif", "#{@images_path}/radio.gif"
      end
      
      
      
      puts %Q{
         Your Form Elements now have Flair!
         
         
         Copy and Paste the following to your css file:
         
         /* Custom Checkbox */
         span.checkbox {
            width: 19px;
            height: #{@checkbox_height}px;
            padding: 0 5px 0 0;
            background: url(#{@images_path.gsub("public","..")}/checkbox.gif) no-repeat;
            display: block;
            clear: left;
            float: left;
         }
         
         /* Custom Radio Button */
         span.radio {
            width: 19px;
            height: #{@radio_height}px;
            padding: 0 5px 0 0;
            background: url(#{@images_path.gsub("public","..")}/radio.gif) no-repeat;
            display: block;
            clear: left;
            float: left;
         }
         
         /* Custom Select */
         span.select {
            position: absolute;
            width: #{(@select_width.to_i - 32)}px; /* With the padding included, the width is 190 pixels: the actual width of the image. */
            height: 21px;
            padding: 0 24px 0 8px;
            color: #fff;
            font: 12px/21px arial, sans-serif;
            background: url(#{@images_path.gsub("public","..")}/select.gif) no-repeat;
            overflow: hidden;
         }
      }
      
      generate_files
   end
end