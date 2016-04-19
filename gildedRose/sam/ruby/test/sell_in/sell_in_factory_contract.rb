module SellInCalculatorFactoryContract
  def validate_sell_in_factory_contract(factory)
    assert_respond_to(factory, :for_item)
  end
end
