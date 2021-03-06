require_relative '../automated_init'

context "Scenarios" do
  [Validate::Controls::Validate::Scenarios, Validate::Controls::Validator::Scenarios].each do |control|

    context "#{control.name}" do
      example = control.example

      # example = Validate::Controls::Validator::Scenarios.example

      scenarios = [:some_scenario, :some_other_scenario]

      state = []
      result = Validate.(example, state, scenarios: scenarios)

      test "Result is the intersection of the results" do
        assert(result == false)
      end

      context "Scenarios are invoked" do
        assert(state.length == 2)

        scenarios.each do |scenario|
          test "#{scenario.inspect}" do
            assert(state.include? scenario)
          end
        end
      end
    end
  end
end
