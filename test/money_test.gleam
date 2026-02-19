import gleeunit
import gleeunit/should
import money/money

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn correct_to_string_format_test() {
  let price = money.new(1999, "BRL")
  let discount = money.new(500, "BRL")

  let assert Ok(final_price) = money.add(price, discount)

  money.to_string(final_price)
  |> should.equal("24.99 BRL")
}

pub fn add_money_test() {
  let price = money.new(1999, "BRL")
  let discount = money.new(500, "BRL")

  money.add(price, discount)
  |> should.equal(Ok(money.new(2499, "BRL")))
}

pub fn currency_mismatch_test() {
  let v1 = money.new(2000, "BRL")
  let v2 = money.new(1000, "USD")

  money.add(v1, v2)
  |> should.be_error
}
