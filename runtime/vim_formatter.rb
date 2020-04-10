require 'rspec/core/formatters/base_text_formatter'

# :reek:FeatureEnvy :reek:DuplicateMethodCall :reek:ManualDispatch :reek:NilCheck
class VimFormatter < RSpec::Core::Formatters::BaseFormatter
  RSpec::Core::Formatters.register self, :example_failed, :dump_summary

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

  def dump_summary(summary)
    output.print summary.totals_line
    output.puts ", took #{summary.formatted_load_time} to load, #{summary.formatted_duration} to run"
  end

  private

  def format_failure(failure)
    app_directories = %r{/usr/src/app/|/home/apps/app/}
    bundle_path = %r{vendor/bundle}
    file_path = failure
      .exception
      .backtrace
      .select { |item| item =~ app_directories }
      .reject { |item| item =~ bundle_path }
      .first
      .try(:gsub, app_directories, '')
    message   = failure.exception.message
    separator = message.lines.size > 1 ? ': ' : "\n\t"

    [file_path, message].join(separator)
  end
end
