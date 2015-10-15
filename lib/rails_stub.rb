require 'pathname'

module Rails
  unless Rails.respond_to?(:root)
    def self.root
      Pathname.new(File.expand_path(File.dirname(File.dirname(__FILE__))))
    end
  end
end