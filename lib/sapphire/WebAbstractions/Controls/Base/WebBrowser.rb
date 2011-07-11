module Sapphire
  module WebAbstractions
    module WebBrowser

      attr_reader :rootUrl

      def Init(url)
        @rootUrl = url
      end

      def SetRootUrl(url)
        if(url.instance_of?(String))
          self.Init(url)
        else
          x = url.new().Url
          self.Init(x)
        end
      end

      def NavigateTo(page)
        if(page.is_a? Class)
          nav = page.new self
        else
          nav = page
        end

        self.browser.get "https://" + nav.Url
        nav
      end

      def CurrentUrl
        self.current_url
      end

      def Reload
        self.browser.get self.current_url
      end

      def ShouldNavigateTo(page)
        if(page.is_a? Class)
          nav = page.new self
        else
          nav = page
        end

        temp = self.current_url.upcase.start_with?("HTTPS://" + nav.Url.upcase) == true

        return temp, nav
      end

      def Run(background)
        scenario = background.new self
        scenario.Run
      end

      def ShouldShow(page)
        self.ShouldNavigateTo page
      end

      def ShouldTransitionTo(url)
        if(url.instance_of?(String))
          temp = self.current_url.upcase.start_with?("HTTPS://" + url.upcase) == true
          @rootUrl = url
        else
          x = url.new().Url
          temp = self.current_url.upcase.start_with?("HTTPS://" + x.upcase) == true
          @rootUrl = x
        end

        return temp
      end
    end
  end
end


