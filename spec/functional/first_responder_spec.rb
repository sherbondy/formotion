describe "FormController/FirstResponder" do
  tests Formotion::FormController

  # By default, `tests` uses @controller.init
  # this isn't ideal for our case, so override.
  def controller
    @form ||= Formotion::Form.new({
      first_responder: [0,0],
      sections: [{
        rows: [{
          title: "Username",
          key: :username,
          type: :string,
          placeholder: "Required"
        }]
      }]
    })

    @controller ||= Formotion::FormController.alloc.initWithForm(@form)
  end

  it "should become first responder" do
    wait 1 do
      @form.sections[0].rows[0].text_field.isFirstResponder.should == true
    end
  end
end