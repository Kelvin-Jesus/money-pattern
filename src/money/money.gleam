//// This module provides types and methods for safe monetary calculations

import gleam/float
import gleam/int

/// Monetary value that consists of a amount and its currency
pub opaque type Money {
  Money(amount_in_cents: Int, currency: String)
}

/// Represents the error when trying to add 
/// two currencies that don't match
pub type MoneyError {
  /// Currencies that failed to match
  CurrencyMismatch(expected_currency: String, received_currency: String)
}

/// Produces a new *Money* ADT
pub fn new(amount: Int, currency: String) -> Money {
  Money(amount, currency)
}

/// Safely add two amounts of money and produce the new amount
/// or, an error otherwise
pub fn add(from: Money, other: Money) -> Result(Money, MoneyError) {
  case other.currency != from.currency {
    True -> Error(CurrencyMismatch(from.currency, other.currency))
    False ->
      Ok(Money(
        amount_in_cents: amount(from) + amount(other),
        currency: from.currency,
      ))
  }
}

/// produces the amount_in_cents from *money* as a int 
fn amount(money: Money) -> Int {
  money.amount_in_cents
}

/// Produce the *m* amount and its currency as a string
pub fn to_string(m: Money) -> String {
  float.to_string(float.to_precision(
    { int.to_float(m.amount_in_cents) /. 100.0 },
    2,
  ))
  <> " "
  <> m.currency
}
