# delegate_to_instance

Helper for single purpose objects

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'delegate_to_instance'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install delegate_to_instance

## Usage

Write
```ruby
class SendInvoiceJob
  extend DelegateToInstance
  delegate_to_instance :perform
  
  def initialize(invoice_id, recipients)
    @invoice_id, @recipients = invoice_id, recipients
  end
  
  def perform
    send_invoice(invoice_id, recipients)
  end
end
```

instead of
```ruby
class SendInvoiceJob
  def self.perform(invoice_id, recipients)
    new(invoice_id, recipients).perform
  end
  
  def initialize(invoice_id, recipients)
    @invoice_id, @recipients = invoice_id, recipients
  end
  
  def perform
    send_invoice(invoice_id, recipients)
  end
end
```

## Why

When I write single purpose objects, like
```ruby
class HTMLSanitizer
  def self.sanitize(html)
    new(html).sanitize
  end
  
  def initialize(html)
    @html = html
  end
  
  def sanitize
    sanitize_html(html)
  end
end
```
I often find myself writing a class level delegator (and corresponding tests for it)
```ruby
class HTMLSanitizer
  def self.sanitize(html)
    new(html).sanitize
  end

  # ...
```

Instead, just write
```ruby
class HTMLSanitizer
  include DelegateToInstance
  delegate_to_instance :sanitize
  
  # ...
```

## TODO

1. Add a RSpec matcher
