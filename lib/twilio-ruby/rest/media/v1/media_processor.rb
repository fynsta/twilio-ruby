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
                class MediaProcessorList < ListResource
                    ##
                    # Initialize the MediaProcessorList
                    # @param [Version] version Version that contains the resource
                    # @return [MediaProcessorList] MediaProcessorList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/MediaProcessors"
                        
                    end
                    ##
                    # Create the MediaProcessorInstance
                    # @param [String] extension The [Media Extension](/docs/live/api/media-extensions-overview) name or URL. Ex: `video-composer-v2`
                    # @param [String] extension_context The context of the Media Extension, represented as a JSON dictionary. See the documentation for the specific [Media Extension](/docs/live/api/media-extensions-overview) you are using for more information about the context to send.
                    # @param [Object] extension_environment User-defined environment variables for the Media Extension, represented as a JSON dictionary of key/value strings. See the documentation for the specific [Media Extension](/docs/live/api/media-extensions-overview) you are using for more information about whether you need to provide this.
                    # @param [String] status_callback The URL to which Twilio will send asynchronous webhook requests for every MediaProcessor event. See [Status Callbacks](/docs/live/status-callbacks) for details.
                    # @param [String] status_callback_method The HTTP method Twilio should use to call the `status_callback` URL. Can be `POST` or `GET` and the default is `POST`.
                    # @param [String] max_duration The maximum time, in seconds, that the MediaProcessor can run before automatically ends. The default value is 300 seconds, and the maximum value is 90000 seconds. Once this maximum duration is reached, Twilio will end the MediaProcessor, regardless of whether media is still streaming.
                    # @return [MediaProcessorInstance] Created MediaProcessorInstance
                    def create(
                        extension: nil, 
                        extension_context: nil, 
                        extension_environment: :unset, 
                        status_callback: :unset, 
                        status_callback_method: :unset, 
                        max_duration: :unset
                    )

                        data = Twilio::Values.of({
                            'Extension' => extension,
                            'ExtensionContext' => extension_context,
                            'ExtensionEnvironment' => Twilio.serialize_object(extension_environment),
                            'StatusCallback' => status_callback,
                            'StatusCallbackMethod' => status_callback_method,
                            'MaxDuration' => max_duration,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        MediaProcessorInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists MediaProcessorInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Order] order The sort order of the list by `date_created`. Can be: `asc` (ascending) or `desc` (descending) with `desc` as the default.
                    # @param [Status] status Status to filter by, with possible values `started`, `ended` or `failed`.
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
                    # @param [Status] status Status to filter by, with possible values `started`, `ended` or `failed`.
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
                    # When passed a block, yields MediaProcessorInstance records from the API.
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
                    # Retrieve a single page of MediaProcessorInstance records from the API.
                    # Request is executed immediately.
                    # @param [Order] order The sort order of the list by `date_created`. Can be: `asc` (ascending) or `desc` (descending) with `desc` as the default.
                    # @param [Status] status Status to filter by, with possible values `started`, `ended` or `failed`.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of MediaProcessorInstance
                    def page(order: :unset, status: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            Order' => order,
                            
                            Status' => status,
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        MediaProcessorPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of MediaProcessorInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of MediaProcessorInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    MediaProcessorPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Media.V1.MediaProcessorList>'
                    end
                end


                class MediaProcessorContext < InstanceContext
                    ##
                    # Initialize the MediaProcessorContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The SID of the MediaProcessor resource to update.
                    # @return [MediaProcessorContext] MediaProcessorContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/MediaProcessors/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Fetch the MediaProcessorInstance
                    # @return [MediaProcessorInstance] Fetched MediaProcessorInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        MediaProcessorInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the MediaProcessorInstance
                    # @param [UpdateStatus] status 
                    # @return [MediaProcessorInstance] Updated MediaProcessorInstance
                    def update(
                        status: nil
                    )

                        data = Twilio::Values.of({
                            'Status' => status,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        MediaProcessorInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Media.V1.MediaProcessorContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Media.V1.MediaProcessorContext #{context}>"
                    end
                end

                class MediaProcessorPage < Page
                    ##
                    # Initialize the MediaProcessorPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [MediaProcessorPage] MediaProcessorPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of MediaProcessorInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [MediaProcessorInstance] MediaProcessorInstance
                    def get_instance(payload)
                        MediaProcessorInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Media.V1.MediaProcessorPage>'
                    end
                end
                class MediaProcessorInstance < InstanceResource
                    ##
                    # Initialize the MediaProcessorInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this MediaProcessor
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [MediaProcessorInstance] MediaProcessorInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'sid' => payload['sid'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'extension' => payload['extension'],
                            'extension_context' => payload['extension_context'],
                            'status' => payload['status'],
                            'url' => payload['url'],
                            'ended_reason' => payload['ended_reason'],
                            'status_callback' => payload['status_callback'],
                            'status_callback_method' => payload['status_callback_method'],
                            'max_duration' => payload['max_duration'] == nil ? payload['max_duration'] : payload['max_duration'].to_i,
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [MediaProcessorContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = MediaProcessorContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the MediaProcessor resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The unique string generated to identify the MediaProcessor resource.
                    def sid
                        @properties['sid']
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
                    # @return [String] The [Media Extension](/docs/live/api/media-extensions-overview) name or URL. Ex: `video-composer-v2`
                    def extension
                        @properties['extension']
                    end
                    
                    ##
                    # @return [String] The context of the Media Extension, represented as a JSON dictionary. See the documentation for the specific [Media Extension](/docs/live/api/media-extensions-overview) you are using for more information about the context to send.
                    def extension_context
                        @properties['extension_context']
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
                    # @return [String] The reason why a MediaProcessor ended. When a MediaProcessor is in progress, will be `null`. When a MediaProcessor is completed, can be `ended-via-api`, `max-duration-exceeded`, `error-loading-extension`, `error-streaming-media` or `internal-service-error`. See [ended reasons](/docs/live/api/mediaprocessors#mediaprocessor-ended-reason-values) for more details.
                    def ended_reason
                        @properties['ended_reason']
                    end
                    
                    ##
                    # @return [String] The URL to which Twilio will send asynchronous webhook requests for every MediaProcessor event. See [Status Callbacks](/docs/live/status-callbacks) for details.
                    def status_callback
                        @properties['status_callback']
                    end
                    
                    ##
                    # @return [String] The HTTP method Twilio should use to call the `status_callback` URL. Can be `POST` or `GET` and the default is `POST`.
                    def status_callback_method
                        @properties['status_callback_method']
                    end
                    
                    ##
                    # @return [String] The maximum time, in seconds, that the MediaProcessor can run before automatically ends. The default value is 300 seconds, and the maximum value is 90000 seconds. Once this maximum duration is reached, Twilio will end the MediaProcessor, regardless of whether media is still streaming.
                    def max_duration
                        @properties['max_duration']
                    end
                    
                    ##
                    # Fetch the MediaProcessorInstance
                    # @return [MediaProcessorInstance] Fetched MediaProcessorInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the MediaProcessorInstance
                    # @param [UpdateStatus] status 
                    # @return [MediaProcessorInstance] Updated MediaProcessorInstance
                    def update(
                        status: nil
                    )

                        context.update(
                            status: status, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Media.V1.MediaProcessorInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Media.V1.MediaProcessorInstance #{values}>"
                    end
                end

            end
        end
    end
end
