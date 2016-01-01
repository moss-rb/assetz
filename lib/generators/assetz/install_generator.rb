require 'rails/generators'
require 'pathname'

module Assetz
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc 'Install Assetz into your Rails application.'
      source_root File.expand_path('../../templates', __FILE__)

      def run_generator
        check_npm
        install_brunch
        setup_brunch
        add_to_gitignore
        create_static_directory
      end

      private

      def add_to_gitignore
        gitignore = destination_root + '/.gitignore'
        puts 'Adding /node_modules to .gitignore...'

        unless File.exist?(gitignore)
          create_file('.gitignore', '/node_modules')
          return
        end

        return unless Pathname.new(gitignore).read.include?('/node_modules')
        inject_into_file '.gitignore', after: ".byebug_history\n" do
          '/node_modules'
        end
      end

      def check_npm
        # Make sure NPM is installed
        return unless `which npm`.empty?
        puts 'The npm package manager is required for use with Assetz.'
        puts 'See https://docs.npmjs.com/getting-started/installing-node for more information'
      end

      def create_static_directory
        return if Dir.exist?(destination_root + '/app/static')
        puts 'Creating app/static directory...'

        # Main app/static directory
        FileUtils.mkdir_p(destination_root + '/app/static')

        create_static_css_directory
        create_static_js_directory
        create_static_vendor_directory
      end

      def create_static_css_directory
        # app/static/css directory
        css_dir = destination_root + '/app/static/css'
        FileUtils.mkdir_p(css_dir)
        FileUtils.touch(css_dir + '/.keep')
      end

      def create_static_js_directory
        # app/static/js directory
        js_dir = destination_root + '/app/static/js'
        FileUtils.mkdir_p(js_dir)
        FileUtils.touch(js_dir + '/.keep')
      end

      def create_static_vendor_directory
        # app/static/vendor directory
        vendor_dir = destination_root + '/app/static/vendor'
        FileUtils.mkdir_p(vendor_dir)
        FileUtils.touch(vendor_dir + '/.keep')
      end

      def install_brunch
        # Create 'package.json' if it does not exist already
        unless File.exist?(destination_root + '/package.json')
          puts 'Creating an npm package.json file...'
          copy_file('package.json', 'package.json')
        end

        # Install Brunch
        puts 'Installing Brunch and recommended plugins...'
        inside(destination_root) do
          run('npm install')
        end
      end

      def setup_brunch
        # Setup Brunch
        puts 'Creating Brunch configuration file...'
        copy_file('brunch-config.js', 'brunch-config.js')
      end
    end
  end
end
