import gleeunit
import money

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn add_money_test() {
  let price = money.Money(1999, "BRL")
  let discount = money.Money(500, "BRL")

  let assert Ok(final_price) = money.add(price, discount)

  assert final_price.amount_in_cents == 2499
}

pub fn add_money_and_check_format_test() {
  let price = money.Money(1999, "BRL")
  let discount = money.Money(500, "BRL")

  let assert Ok(final_price) = money.add(price, discount)

  assert money.to_string(final_price) == "24.99 BRL"
}
