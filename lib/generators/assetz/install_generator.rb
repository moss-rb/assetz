require 'rails/generators/base'

module Assetz
  module Generators
    class InstallGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a Devise initializer and copy locale files to your application."

      def run_generator
        # Make sure NPM is installed
        if `which npm`.empty?
          puts 'The npm package manager is required for use with Assetz. See https://docs.npmjs.com/getting-started/installing-node for more information'
        end

        # Install Brunch
        puts 'Installing Brunch...'
        `npm install brunch --save-dev`
        puts 'Installing recommended Brunch JS plugins...'
        `npm install babel-brunch javascript-brunch uglify-js-brunch --save-dev`
        puts 'Installing recommended Brunch CSS plugins...'
        `npm install css-brunch --save-dev`

        # Setup Brunch
        copy_file('brunch-config.js', 'brunch-config.js')
      end
    end
  end
end
