module QualityCalculatorContract
  def validate_quality_calculator_contract(calculator)
    assert_respond_to(calculator, :calculate_quality)
  end
end
