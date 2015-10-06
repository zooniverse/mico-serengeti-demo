require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  test "regions" do
    subject = Subject.new(mico_data: {"id"=>"783da340-8e23-4e8c-8fd9-bef5683ae407/365b438a-6d53-42e1-991a-5bf32a71b790",
                                      "status"=>"finished",
                                      "objects"=>
                                       [{"h"=>90, "w"=>100, "x"=>315, "y"=>225, "animal"=>"ostrich", "confidence"=>"2.4445700645446777"},
                                        {"h"=>93, "w"=>64, "x"=>324, "y"=>222, "animal"=>"wildebeest", "confidence"=>"2.2090799808502197"},
                                        {"h"=>222, "w"=>155, "x"=>244, "y"=>178, "animal"=>"warthog", "confidence"=>"1.8581899404525757"},
                                        {"h"=>81, "w"=>91, "x"=>327, "y"=>225, "animal"=>"warthog", "confidence"=>"1.8409199714660645"},
                                        {"h"=>154, "w"=>172, "x"=>250, "y"=>192, "animal"=>"warthog", "confidence"=>"1.5926200151443481"},
                                        {"h"=>79, "w"=>55, "x"=>328, "y"=>224, "animal"=>"buffalo", "confidence"=>"2.1139700412750244"}],
                                      "objectsFound"=>6,
                                      "processingEnd"=>"2015-10-06T08:34:31Z",
                                      "processingBegin"=>"2015-10-06T10:34:30Z"})

    assert_equal 6, subject.regions.size
  end
end
