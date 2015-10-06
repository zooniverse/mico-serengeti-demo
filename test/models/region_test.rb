require 'test_helper'

class RegionTest < ActiveSupport::TestCase
  test "identity" do
    region = Region.new("region-1", {"h"=>90, "w"=>100, "x"=>315, "y"=>225, "animal"=>"ostrich", "confidence"=>"2.4445700645446777"})
    assert_equal "region-1", region.id
  end

  test "rect properties" do
    region = Region.new("region-1", {"h"=>90, "w"=>100, "x"=>315, "y"=>225, "animal"=>"ostrich", "confidence"=>"2.4445700645446777"})

    assert_equal 315, region.x
    assert_equal 225, region.y
    assert_equal 100, region.width
    assert_equal 90, region.height
    assert_equal "ostrich", region.animal
    assert_equal 2.44, region.confidence.round(2)
  end
end
