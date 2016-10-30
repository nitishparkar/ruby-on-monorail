class Object
  def self.const_missing(const)
    return if @inside_const_missing

    require RubyOnMonorail.to_underscore(const.to_s)
    @inside_const_missing = true
    klass = Object.const_get(const)
    @inside_const_missing = false
    klass
  end
end
