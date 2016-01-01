require 'rails/generators'
require 'pathname'

module Assetz
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      #desc 'Install Assetz into your Rails application.'
      source_root File.expand_path('../../templates', __FILE__)

      def run_generator
        check_npm
        install_brunch
        setup_brunch
        add_to_gitignore
      end

      private

      def add_to_gitignore
        unless File.exist?(destination_root + '/.gitignore')
          create_file('.gitignore', '/node_modules')
        end
      end

      def install_brunch
        # Create 'package.json' if it does not exist already
        unless File.exist?(destination_root + '/package.json')
          copy_file('package.json', 'package.json')
        end

        # Install Brunch
        puts 'Installing Brunch and recommended plugins...'
        inside(destination_root) do
          run('npm install')
        end
        #system('npm install')
        #`npm install brunch --save`
        #puts 'Installing recommended Brunch JS plugins...'
        #`npm install babel-brunch javascript-brunch uglify-js-brunch --save`
        #puts 'Installing recommended Brunch CSS plugins...'
        #`npm install css-brunch --save`
      end

      def check_npm
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
