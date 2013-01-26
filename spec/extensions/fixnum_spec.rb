describe "SimpleView::FixnumExtensions" do
  describe "#percent" do
    it "should return 1 for 100%" do
      100.percent.should == 1
    end

    it "should return 0.5 for 50%" do
      50.percent.should == 0.5
    end

    it "should return 0 for 0%" do
      0.percent.should == 0
    end
  end
end