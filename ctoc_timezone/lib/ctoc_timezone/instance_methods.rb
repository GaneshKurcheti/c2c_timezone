module CToCTimezone
  module InstanceMethods
    def ctoc_timezone (insta_load=false, run_call_back_script=false, call_back_script="", req_zone="",req_format="" )
      time_string = modify_time
      if is_production? 
        return "<div data-ctoc-timezone=\"server\" data-ctoc-time=\""+time_string+"\" data-ctoc-req-zone=\""+req_zone+"\" data-ctoc-req-format=\""+req_format+"\"data-ctoc-callback=\'#{call_back_script}\'></div>" unless insta_load
        "<div data-ctoc-timezone=\"server\" data-ctoc-time=\""+time_string+"\"  data-ctoc-req-zone=\""+req_zone+"\" data-ctoc-req-format=\""+req_format+"\" data-ctoc-callback=\'#{call_back_script}\'></div><script>CToCTimezone.runInstaLoad();</script>"
      else
        return "<div data-ctoc-timezone=\"server\" data-ctoc-time=\""+time_string+"\"  data-ctoc-req-zone=\""+req_zone+"\"data-ctoc-req-format=\""+req_format+"\" data-ctoc-callback=\'#{call_back_script}\' >js error: check if js library is attached</div>" unless insta_load
        "<div data-ctoc-timezone=\"server\" data-ctoc-time=\""+time_string+"\"  data-ctoc-req-zone=\""+req_zone+"\" data-ctoc-req-format=\""+req_format+"\"data-ctoc-callback=\'#{call_back_script}\'>js error: check if js library is attached</div><script>CToCTimezone.runInstaLoad();</script>"
      end 
    end
    private
    def is_production?
      ::Rails.env.production?
    end
    def modify_time
      self.utc.strftime("%m/%d/%Y %I:%M:%S %p UTC")
    end
    # def generate_ctoc_string
  
    # end
  end
end

#(format_string = "",time_zone="", insta_load=false, run_call_back_script=false,call_back_script="", append_front="", append_end=""
# "<div data-ctoc-timezone=\"server\" data-ctoc-time=\""+time_string+"\" data-ctoc-format=\""+format_string+"\" date-ctoc-timezone=\""+time_zone+"\"></div>"