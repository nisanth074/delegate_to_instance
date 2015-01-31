require "delegate_to_instance/version"

module DelegateToInstance
  def delegate_to_instance(method)
    define_singleton_method(method) do |*args|
      new(*args).public_send(method)
    end
  end
end
