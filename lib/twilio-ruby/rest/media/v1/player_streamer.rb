##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Media
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Media < MediaBase
            class V1 < Version
                class PlayerStreamerList < ListResource
                    ##
                    # Initialize the PlayerStreamerList
                    # @param [Version] version Version that contains the resource
                    # @return [PlayerStreamerList] PlayerStreamerList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/PlayerStreamers"
                        
                    end
                    ##
                    # Create the PlayerStreamerInstance
                    # @param [Boolean] video Specifies whether the PlayerStreamer is configured to stream video. Defaults to `true`.
                    # @param [String] status_callback The URL to which Twilio will send asynchronous webhook requests for every PlayerStreamer event. See [Status Callbacks](/docs/live/status-callbacks) for more details.
                    # @param [String] status_callback_method The HTTP method Twilio should use to call the `status_callback` URL. Can be `POST` or `GET` and the default is `POST`.
                    # @param [String] max_duration The maximum time, in seconds, that the PlayerStreamer is active (`created` or `started`) before automatically ends. The default value is 300 seconds, and the maximum value is 90000 seconds. Once this maximum duration is reached, Twilio will end the PlayerStreamer, regardless of whether media is still streaming.
                    # @return [PlayerStreamerInstance] Created PlayerStreamerInstance
                    def create(
                        video: :unset, 
                        status_callback: :unset, 
                        status_callback_method: :unset, 
                        max_duration: :unset
                    )

                        data = Twilio::Values.of({
                            'Video' => video,
                            'StatusCallback' => status_callback,
                            'StatusCallbackMethod' => status_callback_method,
                            'MaxDuration' => max_duration,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        PlayerStreamerInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists PlayerStreamerInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Order] order The sort order of the list by `date_created`. Can be: `asc` (ascending) or `desc` (descending) with `desc` as the default.
                    # @param [Status] status Status to filter by, with possible values `created`, `started`, `ended`, or `failed`.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(order: :unset, status: :unset, limit: nil, page_size: nil)
                        self.stream(
                            order: order,
                            status: status,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Order] order The sort order of the list by `date_created`. Can be: `asc` (ascending) or `desc` (descending) with `desc` as the default.
                    # @param [Status] status Status to filter by, with possible values `created`, `started`, `ended`, or `failed`.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(order: :unset, status: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            order: order,
                            status: status,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields PlayerStreamerInstance records from the API.
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
                    # Retrieve a single page of PlayerStreamerInstance records from the API.
                    # Request is executed immediately.
                    # @param [Order] order The sort order of the list by `date_created`. Can be: `asc` (ascending) or `desc` (descending) with `desc` as the default.
                    # @param [Status] status Status to filter by, with possible values `created`, `started`, `ended`, or `failed`.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of PlayerStreamerInstance
                    def page(order: :unset, status: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            Order' => order,
                            
                            Status' => status,
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        PlayerStreamerPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of PlayerStreamerInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of PlayerStreamerInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    PlayerStreamerPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Media.V1.PlayerStreamerList>'
                    end
                end


                class PlayerStreamerContext < InstanceContext
                    ##
                    # Initialize the PlayerStreamerContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The SID of the PlayerStreamer resource to update.
                    # @return [PlayerStreamerContext] PlayerStreamerContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/PlayerStreamers/#{@solution[:sid]}"

                        # Dependents
                        @playback_grant = nil
                    end
                    ##
                    # Fetch the PlayerStreamerInstance
                    # @return [PlayerStreamerInstance] Fetched PlayerStreamerInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        PlayerStreamerInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the PlayerStreamerInstance
                    # @param [UpdateStatus] status 
                    # @return [PlayerStreamerInstance] Updated PlayerStreamerInstance
                    def update(
                        status: nil
                    )

                        data = Twilio::Values.of({
                            'Status' => status,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        PlayerStreamerInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the playback_grant
                    # @return [PlaybackGrantList]
                    # @return [PlaybackGrantContext]
                    def playback_grant
                        PlaybackGrantContext.new(
                                @version,
                                @solution[:sid]
                                )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Media.V1.PlayerStreamerContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Media.V1.PlayerStreamerContext #{context}>"
                    end
                end

                class PlayerStreamerPage < Page
                    ##
                    # Initialize the PlayerStreamerPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [PlayerStreamerPage] PlayerStreamerPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of PlayerStreamerInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [PlayerStreamerInstance] PlayerStreamerInstance
                    def get_instance(payload)
                        PlayerStreamerInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Media.V1.PlayerStreamerPage>'
                    end
                end
                class PlayerStreamerInstance < InstanceResource
                    ##
                    # Initialize the PlayerStreamerInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this PlayerStreamer
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [PlayerStreamerInstance] PlayerStreamerInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'video' => payload['video'],
                            'links' => payload['links'],
                            'sid' => payload['sid'],
                            'status' => payload['status'],
                            'url' => payload['url'],
                            'status_callback' => payload['status_callback'],
                            'status_callback_method' => payload['status_callback_method'],
                            'ended_reason' => payload['ended_reason'],
                            'max_duration' => payload['max_duration'] == nil ? payload['max_duration'] : payload['max_duration'].to_i,
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [PlayerStreamerContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = PlayerStreamerContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the PlayerStreamer resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [Boolean] Specifies whether the PlayerStreamer is configured to stream video. Defaults to `true`.
                    def video
                        @properties['video']
                    end
                    
                    ##
                    # @return [Hash] The URLs of related resources.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # @return [String] The unique string generated to identify the PlayerStreamer resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [String] The URL to which Twilio will send asynchronous webhook requests for every PlayerStreamer event. See [Status Callbacks](/docs/live/status-callbacks) for more details.
                    def status_callback
                        @properties['status_callback']
                    end
                    
                    ##
                    # @return [String] The HTTP method Twilio should use to call the `status_callback` URL. Can be `POST` or `GET` and the default is `POST`.
                    def status_callback_method
                        @properties['status_callback_method']
                    end
                    
                    ##
                    # @return [EndedReason] 
                    def ended_reason
                        @properties['ended_reason']
                    end
                    
                    ##
                    # @return [String] The maximum time, in seconds, that the PlayerStreamer is active (`created` or `started`) before automatically ends. The default value is 300 seconds, and the maximum value is 90000 seconds. Once this maximum duration is reached, Twilio will end the PlayerStreamer, regardless of whether media is still streaming.
                    def max_duration
                        @properties['max_duration']
                    end
                    
                    ##
                    # Fetch the PlayerStreamerInstance
                    # @return [PlayerStreamerInstance] Fetched PlayerStreamerInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the PlayerStreamerInstance
                    # @param [UpdateStatus] status 
                    # @return [PlayerStreamerInstance] Updated PlayerStreamerInstance
                    def update(
                        status: nil
                    )

                        context.update(
                            status: status, 
                        )
                    end

                    ##
                    # Access the playback_grant
                    # @return [playback_grant] playback_grant
                    def playback_grant
                        context.playback_grant
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Media.V1.PlayerStreamerInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Media.V1.PlayerStreamerInstance #{values}>"
                    end
                end

            end
        end
    end
end
