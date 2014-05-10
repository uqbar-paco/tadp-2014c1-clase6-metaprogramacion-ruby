class Array


  def self.m(algo)

  end


  def filtrada(&bloque)

    @bloque = bloque

    def self.<<(elemento)
          bloque = @bloque

          if bloque.call(elemento)
            super(elemento)
          else
            self
          end
    end

    # class << self
    #
    #   def <<(elemento)
    #
    #     bloque = @bloque
    #
    #     if bloque.call(elemento)
    #       super(elemento)
    #     else
    #       self
    #     end
    #
    #   end
    # end

    # self.singleton_class.send(:define_method, :<<) {
    #     |elemento|
    #
    #   if bloque.call(elemento)
    #     super(elemento)
    #   else
    #     self
    #   end
    # }
    #

    self

  end

end