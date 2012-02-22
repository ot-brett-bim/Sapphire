module Sapphire
  module DSL
    module Browser
      def Second(value)
        second = Second.new(value, $compare1, $compare2)
        $compare1 = nil
        $compare2 = nil
        return second
      end

      class Second

        def initialize(value, compare1, compare2)
          @value = value
          if(compare1.is_a?(String))
            @compare1 = Time.parse(compare1)
          else
            @compare1 = compare1
          end

          if(compare2.is_a?(String))
            @compare2 = Time.parse(compare2)
          else
            @compare2 = compare2
          end
        end

        def Differ(comparator)
          return Fix(DifferComparison.new(Evaluation.new(@compare1.sec + @value, @compare2.sec)), comparator)
        end

        def Fix(evaluation, comparator)
          comparator = comparator.Create(evaluation)

          comparator
        end

      end
    end
  end
end

