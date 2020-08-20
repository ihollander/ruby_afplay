module RubyAfplay
  class Player

    def initialize(file_path, options = {})
      @command = file_path + build_options_string(options)
    end
    
    def play
      if @process_id
        # resume playing if the process is already running
        Process.kill("SIGCONT", @process_id)
      else
        start_process!
      end
    end
  
    def pause
      # send a stop signal to afplay using the process_id
      Process.kill("SIGSTOP", @process_id)
    end
  
    def stop
      # send a kill signal to aflpay using the process_id
      Process.kill("SIGKILL", @process_id)
      # detach the process
      detach_process!
    end
  
    private
  
    def build_options_string(options)
      valid_options = %i(volume time rate quality)
      options_string = ""
      options.each do |key, value|
        options_string += " -#{key[0]} #{value}" if valid_options.include?(key)
      end
      options_string
    end

    def start_process!
      # start playing by running 'afplay'
      # spawn lets us returns a process_id we can use with other commands
      @process_id = spawn "afplay #{@command}"
    end

  
    def detach_process!
      # detaches process
      Process.detach(@process_id)
      # clear the process_id reference
      @process_id = nil?
    end

  end
end