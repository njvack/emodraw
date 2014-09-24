require 'test_helper'

class ExperimentTest < ActiveSupport::TestCase
  test "created experiments get a slug" do
    exp = Experiment.create(:name => "My name!")
    assert_not_nil exp.url_slug
  end
end
