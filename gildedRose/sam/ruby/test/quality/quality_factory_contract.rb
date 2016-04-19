module QualityCalculatorFactoryContract
  def validate_quality_factory_contract(factory)
    assert_respond_to(factory, :for_item)
  end
end
