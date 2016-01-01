require 'test_helper'
require 'generators/assetz/install_generator'
require 'fileutils'

class InstallGeneratorTest < Rails::Generators::TestCase
  tests Assetz::Generators::InstallGenerator
  destination File.expand_path('../../tmp', __FILE__)

  setup do
    prepare_destination
    run_generator
  end

  teardown do
    FileUtils.rm_rf('test/tmp')
  end

  def test_add_to_gitignore
    assert_file('.gitignore', /node_modules/)
  end

  def test_npm_install
    generated_file = Pathname.new(destination_root + '/package.json')
    template_file = Pathname.new(Pathname.pwd.to_s + '/lib/generators/templates/package.json')
    assert_equal(generated_file.read, template_file.read)
  end

  def test_brunch_config
    # Beginning of file
    assert_file('brunch-config.js', /exports.config = {/)
    # End of file
    assert_file('brunch-config.js', /npm: {/)
  end
end
