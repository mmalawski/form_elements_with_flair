module ActionView #:nodoc:
   
   module Helpers
      
      module FormHelper
         
         def check_box_with_flair(object_name, method, options={}, checked_value="1", unchecked_value="0")
            add_flair(options)
            check_box object_name, method, options, checked_value, unchecked_value
         end
         
         
         
         def radio_button_with_flair(object_name, method, tag_value, options={})
            add_flair(options)
            radio_button object_name, method, tag_value, options
         end
         
         private
         
         def add_flair(options)
            html_class = options[:class]
            html_class = (html_class.blank?) ? FLAIR_CLASS : ((html_class.split(" ") << FLAIR_CLASS).reverse.join(" "))
            options[:class] = html_class
            return options
         end
         
      end # FormHelper
      
      
      
      
      
      module FormOptionsHelper
         
         def select_with_flair(object, method, choices, options={}, html_options={})
            add_flair(html_options)
            select object, method, choices, options, html_options
         end
         
         private
         
         def add_flair(options)
            html_class = options[:class]
            html_class = (html_class.blank?) ? FLAIR_CLASS : ((html_class.split(" ") << FLAIR_CLASS).reverse.join(" "))
            options[:class] = html_class
            return options
         end
         
      end # FormOptionsHelper
      
      
      
      
      
      module FormTagHelper
      
         def check_box_tag_with_flair(name, value="1", checked=false, options={})
            add_flair(options)
            check_box_tag name, value, checked, options
         end
         
         
         
         def radio_button_tag_with_flair(name, value, checked=false, options={})
            add_flair(options)
            radio_button_tag name, value, checked, options
         end
         
         
         
         def select_tag_with_flair(name, option_tags=nil, options={})
            add_flair(options)
            select_tag name, option_tags, options
         end
         
         private
         
         def add_flair(options)
            html_class = options[:class]
            html_class = (html_class.blank?) ? FLAIR_CLASS : ((html_class.split(" ") << FLAIR_CLASS).reverse.join(" "))
            options[:class] = html_class
            return options
         end
         
      end # FormTagHelper
      
      
      
      
      
      class FormBuilder
      
         def check_box_with_flair(method, options={}, checked_value="1")
            add_flair(options)
            check_box method, options, checked_value
         end
         
         
         
         def radio_button_with_flair(method, tag_value, options={})
            add_flair(options)
            radio_button method, tag_value, options
         end
         
         
         
         def select_with_flair(method, choices, options={}, html_options={})
            add_flair(html_options)
            select method, choices, options, html_options
         end
         
         private
         
          def add_flair(options)
            html_class = options[:class]
            html_class = (html_class.blank?) ? FLAIR_CLASS : ((html_class.split(" ") << FLAIR_CLASS).reverse.join(" "))
            options[:class] = html_class
            return options
         end
         
      end # FormBuilder
      
   end # Helpers
   
   
end # ActionView