##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Preview
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Preview < PreviewBase
            class Wireless < Version
                class SimList < ListResource
                    ##
                    # Initialize the SimList
                    # @param [Version] version Version that contains the resource
                    # @return [SimList] SimList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Sims"
                        
                    end
                
                    ##
                    # Lists SimInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] status 
                    # @param [String] iccid 
                    # @param [String] rate_plan 
                    # @param [String] e_id 
                    # @param [String] sim_registration_code 
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(status: :unset, iccid: :unset, rate_plan: :unset, e_id: :unset, sim_registration_code: :unset, limit: nil, page_size: nil)
                        self.stream(
                            status: status,
                            iccid: iccid,
                            rate_plan: rate_plan,
                            e_id: e_id,
                            sim_registration_code: sim_registration_code,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] status 
                    # @param [String] iccid 
                    # @param [String] rate_plan 
                    # @param [String] e_id 
                    # @param [String] sim_registration_code 
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(status: :unset, iccid: :unset, rate_plan: :unset, e_id: :unset, sim_registration_code: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            status: status,
                            iccid: iccid,
                            rate_plan: rate_plan,
                            e_id: e_id,
                            sim_registration_code: sim_registration_code,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields SimInstance records from the API.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    def each
                        limits = @version.read_limits

                        page = self.page(page_size: limits[:page_size], )

                        @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
                    end

                    ##
                    # Retrieve a single page of SimInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] status 
                    # @param [String] iccid 
                    # @param [String] rate_plan 
                    # @param [String] e_id 
                    # @param [String] sim_registration_code 
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of SimInstance
                    def page(status: :unset, iccid: :unset, rate_plan: :unset, e_id: :unset, sim_registration_code: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            Status' => status,
                            
                            Iccid' => iccid,
                            
                            RatePlan' => rate_plan,
                            
                            EId' => e_id,
                            
                            SimRegistrationCode' => sim_registration_code,
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        SimPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of SimInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of SimInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    SimPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Preview.Wireless.SimList>'
                    end
                end


                ##
                #PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
                class SimContext < InstanceContext
                    ##
                    # Initialize the SimContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid 
                    # @return [SimContext] SimContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/Sims/#{@solution[:sid]}"

                        # Dependents
                        @usage = nil
                    end
                    ##
                    # Fetch the SimInstance
                    # @return [SimInstance] Fetched SimInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        SimInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the SimInstance
                    # @param [String] unique_name 
                    # @param [String] callback_method 
                    # @param [String] callback_url 
                    # @param [String] friendly_name 
                    # @param [String] rate_plan 
                    # @param [String] status 
                    # @param [String] commands_callback_method 
                    # @param [String] commands_callback_url 
                    # @param [String] sms_fallback_method 
                    # @param [String] sms_fallback_url 
                    # @param [String] sms_method 
                    # @param [String] sms_url 
                    # @param [String] voice_fallback_method 
                    # @param [String] voice_fallback_url 
                    # @param [String] voice_method 
                    # @param [String] voice_url 
                    # @return [SimInstance] Updated SimInstance
                    def update(
                        unique_name: :unset, 
                        callback_method: :unset, 
                        callback_url: :unset, 
                        friendly_name: :unset, 
                        rate_plan: :unset, 
                        status: :unset, 
                        commands_callback_method: :unset, 
                        commands_callback_url: :unset, 
                        sms_fallback_method: :unset, 
                        sms_fallback_url: :unset, 
                        sms_method: :unset, 
                        sms_url: :unset, 
                        voice_fallback_method: :unset, 
                        voice_fallback_url: :unset, 
                        voice_method: :unset, 
                        voice_url: :unset
                    )

                        data = Twilio::Values.of({
                            'UniqueName' => unique_name,
                            'CallbackMethod' => callback_method,
                            'CallbackUrl' => callback_url,
                            'FriendlyName' => friendly_name,
                            'RatePlan' => rate_plan,
                            'Status' => status,
                            'CommandsCallbackMethod' => commands_callback_method,
                            'CommandsCallbackUrl' => commands_callback_url,
                            'SmsFallbackMethod' => sms_fallback_method,
                            'SmsFallbackUrl' => sms_fallback_url,
                            'SmsMethod' => sms_method,
                            'SmsUrl' => sms_url,
                            'VoiceFallbackMethod' => voice_fallback_method,
                            'VoiceFallbackUrl' => voice_fallback_url,
                            'VoiceMethod' => voice_method,
                            'VoiceUrl' => voice_url,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        SimInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the usage
                    # @return [UsageList]
                    # @return [UsageContext]
                    def usage
                        UsageContext.new(
                                @version,
                                @solution[:sid]
                                )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Preview.Wireless.SimContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Preview.Wireless.SimContext #{context}>"
                    end
                end

                class SimPage < Page
                    ##
                    # Initialize the SimPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [SimPage] SimPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of SimInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [SimInstance] SimInstance
                    def get_instance(payload)
                        SimInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Preview.Wireless.SimPage>'
                    end
                end
                class SimInstance < InstanceResource
                    ##
                    # Initialize the SimInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Sim
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [SimInstance] SimInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'unique_name' => payload['unique_name'],
                            'account_sid' => payload['account_sid'],
                            'rate_plan_sid' => payload['rate_plan_sid'],
                            'friendly_name' => payload['friendly_name'],
                            'iccid' => payload['iccid'],
                            'e_id' => payload['e_id'],
                            'status' => payload['status'],
                            'commands_callback_url' => payload['commands_callback_url'],
                            'commands_callback_method' => payload['commands_callback_method'],
                            'sms_fallback_method' => payload['sms_fallback_method'],
                            'sms_fallback_url' => payload['sms_fallback_url'],
                            'sms_method' => payload['sms_method'],
                            'sms_url' => payload['sms_url'],
                            'voice_fallback_method' => payload['voice_fallback_method'],
                            'voice_fallback_url' => payload['voice_fallback_url'],
                            'voice_method' => payload['voice_method'],
                            'voice_url' => payload['voice_url'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [SimContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = SimContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] 
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] 
                    def unique_name
                        @properties['unique_name']
                    end
                    
                    ##
                    # @return [String] 
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] 
                    def rate_plan_sid
                        @properties['rate_plan_sid']
                    end
                    
                    ##
                    # @return [String] 
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] 
                    def iccid
                        @properties['iccid']
                    end
                    
                    ##
                    # @return [String] 
                    def e_id
                        @properties['e_id']
                    end
                    
                    ##
                    # @return [String] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [String] 
                    def commands_callback_url
                        @properties['commands_callback_url']
                    end
                    
                    ##
                    # @return [String] 
                    def commands_callback_method
                        @properties['commands_callback_method']
                    end
                    
                    ##
                    # @return [String] 
                    def sms_fallback_method
                        @properties['sms_fallback_method']
                    end
                    
                    ##
                    # @return [String] 
                    def sms_fallback_url
                        @properties['sms_fallback_url']
                    end
                    
                    ##
                    # @return [String] 
                    def sms_method
                        @properties['sms_method']
                    end
                    
                    ##
                    # @return [String] 
                    def sms_url
                        @properties['sms_url']
                    end
                    
                    ##
                    # @return [String] 
                    def voice_fallback_method
                        @properties['voice_fallback_method']
                    end
                    
                    ##
                    # @return [String] 
                    def voice_fallback_url
                        @properties['voice_fallback_url']
                    end
                    
                    ##
                    # @return [String] 
                    def voice_method
                        @properties['voice_method']
                    end
                    
                    ##
                    # @return [String] 
                    def voice_url
                        @properties['voice_url']
                    end
                    
                    ##
                    # @return [Time] 
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] 
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] 
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Fetch the SimInstance
                    # @return [SimInstance] Fetched SimInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the SimInstance
                    # @param [String] unique_name 
                    # @param [String] callback_method 
                    # @param [String] callback_url 
                    # @param [String] friendly_name 
                    # @param [String] rate_plan 
                    # @param [String] status 
                    # @param [String] commands_callback_method 
                    # @param [String] commands_callback_url 
                    # @param [String] sms_fallback_method 
                    # @param [String] sms_fallback_url 
                    # @param [String] sms_method 
                    # @param [String] sms_url 
                    # @param [String] voice_fallback_method 
                    # @param [String] voice_fallback_url 
                    # @param [String] voice_method 
                    # @param [String] voice_url 
                    # @return [SimInstance] Updated SimInstance
                    def update(
                        unique_name: :unset, 
                        callback_method: :unset, 
                        callback_url: :unset, 
                        friendly_name: :unset, 
                        rate_plan: :unset, 
                        status: :unset, 
                        commands_callback_method: :unset, 
                        commands_callback_url: :unset, 
                        sms_fallback_method: :unset, 
                        sms_fallback_url: :unset, 
                        sms_method: :unset, 
                        sms_url: :unset, 
                        voice_fallback_method: :unset, 
                        voice_fallback_url: :unset, 
                        voice_method: :unset, 
                        voice_url: :unset
                    )

                        context.update(
                            unique_name: unique_name, 
                            callback_method: callback_method, 
                            callback_url: callback_url, 
                            friendly_name: friendly_name, 
                            rate_plan: rate_plan, 
                            status: status, 
                            commands_callback_method: commands_callback_method, 
                            commands_callback_url: commands_callback_url, 
                            sms_fallback_method: sms_fallback_method, 
                            sms_fallback_url: sms_fallback_url, 
                            sms_method: sms_method, 
                            sms_url: sms_url, 
                            voice_fallback_method: voice_fallback_method, 
                            voice_fallback_url: voice_fallback_url, 
                            voice_method: voice_method, 
                            voice_url: voice_url, 
                        )
                    end

                    ##
                    # Access the usage
                    # @return [usage] usage
                    def usage
                        context.usage
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Preview.Wireless.SimInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Preview.Wireless.SimInstance #{values}>"
                    end
                end

            end
        end
    end
end
