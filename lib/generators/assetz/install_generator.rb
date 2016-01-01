require 'rails/generators/base'

module Assetz
  module Generators
    class InstallGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../../templates', __FILE__)

      desc 'Install Assetz into your Rails application.'

      def run_generator
        install_npm
        install_brunch
        setup_brunch
      end

      private

      def install_brunch
        # Install Brunch
        puts 'Installing Brunch...'
        `npm install brunch --save-dev`
        puts 'Installing recommended Brunch JS plugins...'
        `npm install babel-brunch javascript-brunch uglify-js-brunch --save-dev`
        puts 'Installing recommended Brunch CSS plugins...'
        `npm install css-brunch --save-dev`
      end

      def install_npm
        # Make sure NPM is installed
        return unless `which npm`.empty?
        puts 'The npm package manager is required for use with Assetz.'
        puts 'See https://docs.npmjs.com/getting-started/installing-node for more information'
      end

      def setup_brunch
        # Setup Brunch
        copy_file('brunch-config.js', 'brunch-config.js')
      end
    end
  end
end
