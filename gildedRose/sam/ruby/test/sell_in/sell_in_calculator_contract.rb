module SellInCalculatorContract
  def validate_sell_in_calculator_contract(calculator)
    assert_respond_to(calculator, :calculate_sell_in)
  end
end
