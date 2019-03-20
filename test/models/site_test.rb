require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  craig = sites(:first)

  test "name_set" do
    assert craig.first_name == 'Craig'
  end
end
