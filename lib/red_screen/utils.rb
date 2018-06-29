class String

  def to_snake_case
    self.gsub(/::/, '/').         # FooBar => foo_bar
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
        gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr("-", "_").
        downcase
  end

  def to_camel_case
    self if self !~ /_/ && self =~ /[A-Z]+.*/   # foo_bar => FooBar
    split('_').map{|str| str.capitalize}.join
  end
end