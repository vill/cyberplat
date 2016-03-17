## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cyberplat'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cyberplat

## Примерно так, должна выглядеть работа с гемом

```ruby
  cyberplat_client = CyberPlat::Client.new do |c|
    c.op          = ''
    c.sd          = ''
    c.ap          = ''
    c.timeout     = 60 # Время ожидания ответа на любой запрос должно составлять не менее 60 секунд.
    c.ssl_options = {}

    c.configure_adapter(:iso20022) do |adapter|
      adapter.server_certificate   = ''
      adapter.private_operator_key = ''
      adapter.password_private_key = ''
      adapter.operator_certificate = ''
      adapter.connection_urls      = {
        fake_check_url: 'https://service.cyberplat.ru/cgi-bin/iso20022/pay.cgi'
      }
    end

    c.adapter(:default_adapter).configure do |adapter|
      adapter.server_certificate   = ''
      adapter.private_operator_key = ''
      adapter.password_private_key = ''
      adapter.operator_certificate = ''

      adapter.account_receipts_url = 'https://service.cyberplat.ru/cgi-bin/misc/refill_info.cgi'
      adapter.account_balance_url  = 'https://service.cyberplat.ru/cgi-bin/status/get_rest.cgi'
    end

    c.payment_adapter = :iso20022
    c.account_adapter = :default_adapter
  end

  payment = CyberPlat::Payment.new(params)

  cyberplat_client.connection_urls(fake_check_url: '', check_url: '', pay_url: '', account_receipts_url: '', payment_status_url: '', account_balance_url: '')

  cyberplat_client.account_balance
  cyberplat_client.account_receipts(on_date: date1)

  cyberplat_client.find_payment_status_by_session('session')
  cyberplat_client.find_payment_status_by_transaction('transaction')

  cyberplat_client.fake_check(payment)
  cyberplat_client.execute(payment) # Включает в себя :check, :pay
```
## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).