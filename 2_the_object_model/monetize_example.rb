require "monetize"
I18n.config.available_locales = :en
I18n.locale = :en
Money.locale_backend = :i18n

# Class method for Monetize
# class Monetize
#     class << self
#         def from_numeric(value, currency = Money.default_currency)
#             fail ArgumentError, "'value' should be a type of Numeric" unless value.is_a?(Numeric)
#             Money.from_amount(value, currency)
#         end
#     end
# end
bargin_price = Monetize.from_numeric(99, "USD")
bargin_price.format # "$99.00"

# Open Class Numeric add to_money
# class Numeric
#     def to_money(currency = nil)
#       Monetize.from_numeric(self, currency || Money.default_currency)
#     end
# end
standard_price = 100.to_money("USD")
standard_price.format # "$100.00"
