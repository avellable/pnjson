module FixturesFileHelper
  def fixture_file(name)
    File.expand_path("./fixtures/#{name}", File.dirname(__FILE__))
  end
end
