#encoding: utf-8

# Main
module CommandExec
  # Helpers for specs
  module SpecHelper
    # Capture stderr 
    #
    # @param [Block] block
    def capture_stderr(&block)
      previous_stderr, $stderr = $stderr, StringIO.new
      block.call
      return $stderr.string
    ensure
      $stderr = previous_stderr
    end

    # Capture stdout
    #
    # @param [Block] block
    def capture_stdout(&block)
      previous_stdout, $stdout = $stdout, StringIO.new
      block.call
      return $stdout.string
    ensure
      $stdout = previous_stdout
    end

    # Create temporary files for testing
    # (which will be deleted when the
    # ruby process terminates)
    #
    # @param [String] base_name
    #   the path to the temporary file
    #
    # @param [String] content
    #   the content which should be written to the file
    #
    # @return [String] 
    #   the path to the temporary file
    def create_temp_file_with(base_name, content)
      file = Tempfile.new(base_name)
      file.write(content)
      file.close
      file.path
    end
  end
end
