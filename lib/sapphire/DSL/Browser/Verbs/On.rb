module Sapphire
  module DSL
    module Browser
      def On(page)
        page = page.new if page.is_a? Class
        found = $driver.CurrentUrl.upcase.start_with?(page.Url.upcase)
        if(found == false)
          page.AlternateUrls.each do |url|
            if( found == false)
              found = $driver.CurrentUrl.upcase.start_with?(url.upcase)
            end
          end
        end

        return found
      end
    end
  end
end
