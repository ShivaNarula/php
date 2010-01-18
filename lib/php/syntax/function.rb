module PHP
  ##
  # @see http://php.net/manual/en/language.functions.php
  class Function < Expression
    ##
    # @return [Symbol]
    attr_accessor :name

    ##
    # @param  [Symbol, #to_s]         name
    # @param  [Hash{Symbol => Object} options
    def initialize(name = nil, options = {}, &block)
      @name    = Identifier.new(name).to_sym rescue nil
      @options = options

      if block_given?
        # TODO
      end
    end

    ##
    # Returns `true` if this is a named function.
    #
    # @return [Boolean]
    def named?
      !anonymous?
    end

    ##
    # Returns `true` if this is an anonymous function.
    #
    # @return [Boolean]
    def anonymous?
      @name.nil?
    end

    alias_method :unnamed?, :anonymous?

    ##
    # Returns the PHP representation of this function.
    #
    # @return [String]
    def to_php
      if anonymous?
        "function() {}" # TODO
      else
        "function #{name}() {}" # TODO
      end
    end
  end
end
