unless ENV['NAKAL_MODE'].nil?
  module Nakal
    module Android
      class Screen < Common::BaseScreen

        private

        def capture
          B.screenshot.save("#{Nakal.image_location}/#{@name}.png")
        end

      end
    end
  end

end