require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  test "regions" do
    subject = Subject.new(mico_data: {
      "status"=>"finished",
      "contentParts"=>
        [{"contentPart"=>"http://demo1.mico-project.eu:8080/marmotta/8c18520b-024f-4c88-93e0-71ea81d6e592/589427ba-0ae3-4614-96e5-e3ee97b50635",
          "annotatedBy"=>"http://www.mico-project.org/services/mico-extractor-object2RDF",
          "target"=>{"selector"=>{"conformsTo"=>"http://www.w3.org/TR/media-frags/", "value"=>"#xywh=319,36,151,75"}},
          "annotatedAt"=>"2015-10-05 11:28:34.657"},
         {"contentPart"=>"http://demo1.mico-project.eu:8080/marmotta/8c18520b-024f-4c88-93e0-71ea81d6e592/589427ba-0ae3-4614-96e5-e3ee97b50635",
          "annotatedBy"=>"http://www.mico-project.org/services/mico-extractor-object2RDF",
          "target"=>{"selector"=>{"conformsTo"=>"http://www.w3.org/TR/media-frags/", "value"=>"#xywh=411,8,136,68"}},
          "annotatedAt"=>"2015-10-05 11:28:34.784"}],
      "subjectId"=>"61e71cff-f323-4444-ac8f-5a3cd2cf197c",
      "contentItem"=>"http://demo1.mico-project.eu:8080/marmotta/8c18520b-024f-4c88-93e0-71ea81d6e592"})

    assert_equal 2, subject.regions.size
  end
end
