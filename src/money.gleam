import gleam/float
import gleam/int

pub type Money {
  Money(amount_in_cents: Int, currency: String)
}

pub type CurrencyError {
  InvalidCurrencyError
}

pub fn add(from: Money, add: Money) -> Result(Money, CurrencyError) {
  case add.currency != from.currency {
    True -> Error(InvalidCurrencyError)
    False ->
      Ok(Money(
        amount_in_cents: from.amount_in_cents + add.amount_in_cents,
        currency: from.currency,
      ))
  }
}

pub fn to_string(m: Money) -> String {
  float.to_string(float.to_precision(
    { int.to_float(m.amount_in_cents) /. 100.0 },
    2,
  ))
  <> " "
  <> m.currency
}
