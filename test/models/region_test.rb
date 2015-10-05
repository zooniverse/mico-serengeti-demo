require 'test_helper'

class RegionTest < ActiveSupport::TestCase
  test "identity" do
    region = Region.new({"contentPart"=>"http://demo1.mico-project.eu:8080/marmotta/8c18520b-024f-4c88-93e0-71ea81d6e592/589427ba-0ae3-4614-96e5-e3ee97b50635",
                      "annotatedBy"=>"http://www.mico-project.org/services/mico-extractor-object2RDF",
                      "target"=>{"selector"=>{"conformsTo"=>"http://www.w3.org/TR/media-frags/", "value"=>"#xywh=319,36,151,75"}},
                      "annotatedAt"=>"2015-10-05 11:28:34.657"})
    assert_equal "http://demo1.mico-project.eu:8080/marmotta/8c18520b-024f-4c88-93e0-71ea81d6e592/589427ba-0ae3-4614-96e5-e3ee97b50635", region.id
  end

  test "rect properties" do
    region = Region.new({"contentPart"=>"http://demo1.mico-project.eu:8080/marmotta/8c18520b-024f-4c88-93e0-71ea81d6e592/589427ba-0ae3-4614-96e5-e3ee97b50635",
                          "annotatedBy"=>"http://www.mico-project.org/services/mico-extractor-object2RDF",
                          "target"=>{"selector"=>{"conformsTo"=>"http://www.w3.org/TR/media-frags/", "value"=>"#xywh=319,36,151,75"}},
                          "annotatedAt"=>"2015-10-05 11:28:34.657"})

    assert_equal 319, region.x
    assert_equal 36,  region.y
    assert_equal 151, region.width
    assert_equal 75,  region.height
  end
end
