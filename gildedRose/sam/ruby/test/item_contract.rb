require 'test/unit'

module ItemContract 
  def validate_item_contract(item)
    assert_respond_to(item, :update_quality)
  end
end
