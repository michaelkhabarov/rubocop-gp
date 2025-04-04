module RuboCop
  module Cop
    module Gp
      # Modifying Mass assignment restrictions eliminates the entire point of disabling
      # mass assignment. It's a lazy, potentially dangerous approach that should be discouraged.
      class MassAssignmentAccessibleModifier < Base
        MSG = 'Do no override and objects mass assignment restrictions.'.freeze

        def on_send(node)
          _receiver, method_name, *_args = *node

          return unless method_name == :accessible=
          add_offense(node, message: MSG)
        end
      end
    end
  end
end
