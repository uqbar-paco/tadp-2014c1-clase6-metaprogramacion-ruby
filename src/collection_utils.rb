class Array

  def filtrada(&block)

    # @predicado = block
    #
    # class << self
    #     def << (element)
    #       if ( @predicado.call(element) )
    #         super(element)
    #       else
    #         self
    #       end
    #     end
    # end

    # self.define_singleton_method (:<<) do |element|
    #   if ( block.call(element) )
    #     super(element)
    #   else
    #     self
    #   end
    # end

    self.singleton_class.send :define_method, :<< do |element|
      if ( block.call(element) )
        super(element)
      else
        self
      end
    end

    # self.instance_eval {
    #
    #   @predicado = block
    #
    #
    #   def << (element)
    #     if ( @predicado.call(element) )
    #       super(element)
    #     else
    #       self
    #     end
    #   end
    #
    # }

    self

  end

end