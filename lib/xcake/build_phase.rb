module Xcake
  # This class is used to describe a build phase for a
  # Xcode project; This forms part of the DSL
  # and is usually stored in files named `Cakefile`.
  #
  class BuildPhase

    # @param    [Proc] block
    #           an optional block that configures the build phase through the DSL.
    #
    # @example  Creating a Build Phase.
    #
    #           BuildPhase.new do |p|
    #             p.name "test"
    #           end
    #
    def initialize
      yield(self) if block_given?
    end

    # The name of the build phase as shown in Xcode
    attr_accessor :name

    # This method is called when generating the build phases
    # subclasses should implement this to allow xcake to know
    # what native build phase type this DSL Object represents
    #
    def build_phase_type
      raise "build_phase_type not implemented"
    end

    # This method is called when generating the build phases
    # subclasses should implement this to handle the 
    # configuration of the build phase
    #
    def configure_native_build_phase(native_build_phase, context)
      native_build_phase.name = name
    end
  end
end
