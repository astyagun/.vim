require 'rspec/core/formatters/base_text_formatter'

class VimFormatter < RSpec::Core::Formatters::BaseFormatter
  RSpec::Core::Formatters.register self, :example_failed

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def example_failed(failure)
    output.puts format_failure(failure) if failure.exception.backtrace

    if failure.exception.respond_to? :failures
      failure.exception.failures.each do |aggregated_failure|
        output.puts format_failure(aggregated_failure)
      end
    end

    if failure.exception.respond_to? :other_errors # rubocop:disable Style/GuardClause
      failure.exception.other_errors.each do |other_failure|
        output.puts format_failure(other_failure)
      end
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  private

  # :reek:FeatureEnvy
  # :reek:DuplicateMthodCall
  def format_failure(failure)
    call_stack = failure.exception.backtrace.
      find { |item| item.match?(%r{/usr/src/app/}) }&.gsub('/usr/src/app/', '')

    result = format '%s: %s', call_stack, failure.exception.message
    result.tr("\n", ' ')
  end
end
