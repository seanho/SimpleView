describe "SimpleView::Styles" do
  it "should be able to define new style" do
    style = {color: :red}

    SimpleView::Styles.define :test, style
    SimpleView::Styles.for(:test).should == style
  end

  it "should be able to extend existing style" do
    style = {color: :red}
    style_ex = {size: 1}

    SimpleView::Styles.define :test, style
    SimpleView::Styles.define :test, style_ex
    SimpleView::Styles.for(:test).should == {color: :red, size: 1}
  end
end