##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Supersim
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Supersim < SupersimBase
            class V1 < Version
                class EsimProfileList < ListResource
                    ##
                    # Initialize the EsimProfileList
                    # @param [Version] version Version that contains the resource
                    # @return [EsimProfileList] EsimProfileList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/ESimProfiles"
                        
                    end
                    ##
                    # Create the EsimProfileInstance
                    # @param [String] callback_url The URL we should call using the `callback_method` when the status of the eSIM Profile changes. At this stage of the eSIM Profile pilot, the a request to the URL will only be called when the ESimProfile resource changes from `reserving` to `available`.
                    # @param [String] callback_method The HTTP method we should use to call `callback_url`. Can be: `GET` or `POST` and the default is POST.
                    # @param [Boolean] generate_matching_id When set to `true`, a value for `Eid` does not need to be provided. Instead, when the eSIM profile is reserved, a matching ID will be generated and returned via the `matching_id` property. This identifies the specific eSIM profile that can be used by any capable device to claim and download the profile.
                    # @param [String] eid Identifier of the eUICC that will claim the eSIM Profile.
                    # @return [EsimProfileInstance] Created EsimProfileInstance
                    def create(
                        callback_url: :unset, 
                        callback_method: :unset, 
                        generate_matching_id: :unset, 
                        eid: :unset
                    )

                        data = Twilio::Values.of({
                            'CallbackUrl' => callback_url,
                            'CallbackMethod' => callback_method,
                            'GenerateMatchingId' => generate_matching_id,
                            'Eid' => eid,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        EsimProfileInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists EsimProfileInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] eid List the eSIM Profiles that have been associated with an EId.
                    # @param [String] sim_sid Find the eSIM Profile resource related to a [Sim](https://www.twilio.com/docs/wireless/api/sim-resource) resource by providing the SIM SID. Will always return an array with either 1 or 0 records.
                    # @param [Status] status List the eSIM Profiles that are in a given status.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(eid: :unset, sim_sid: :unset, status: :unset, limit: nil, page_size: nil)
                        self.stream(
                            eid: eid,
                            sim_sid: sim_sid,
                            status: status,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] eid List the eSIM Profiles that have been associated with an EId.
                    # @param [String] sim_sid Find the eSIM Profile resource related to a [Sim](https://www.twilio.com/docs/wireless/api/sim-resource) resource by providing the SIM SID. Will always return an array with either 1 or 0 records.
                    # @param [Status] status List the eSIM Profiles that are in a given status.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(eid: :unset, sim_sid: :unset, status: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            eid: eid,
                            sim_sid: sim_sid,
                            status: status,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields EsimProfileInstance records from the API.
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
                    # Retrieve a single page of EsimProfileInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] eid List the eSIM Profiles that have been associated with an EId.
                    # @param [String] sim_sid Find the eSIM Profile resource related to a [Sim](https://www.twilio.com/docs/wireless/api/sim-resource) resource by providing the SIM SID. Will always return an array with either 1 or 0 records.
                    # @param [Status] status List the eSIM Profiles that are in a given status.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of EsimProfileInstance
                    def page(eid: :unset, sim_sid: :unset, status: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'Eid' => eid,
                            'SimSid' => sim_sid,
                            'Status' => status,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        EsimProfilePage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of EsimProfileInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of EsimProfileInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    EsimProfilePage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Supersim.V1.EsimProfileList>'
                    end
                end


                ##
                #PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
                class EsimProfileContext < InstanceContext
                    ##
                    # Initialize the EsimProfileContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The SID of the eSIM Profile resource to fetch.
                    # @return [EsimProfileContext] EsimProfileContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/ESimProfiles/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Fetch the EsimProfileInstance
                    # @return [EsimProfileInstance] Fetched EsimProfileInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        EsimProfileInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Supersim.V1.EsimProfileContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Supersim.V1.EsimProfileContext #{context}>"
                    end
                end

                class EsimProfilePage < Page
                    ##
                    # Initialize the EsimProfilePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [EsimProfilePage] EsimProfilePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of EsimProfileInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [EsimProfileInstance] EsimProfileInstance
                    def get_instance(payload)
                        EsimProfileInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Supersim.V1.EsimProfilePage>'
                    end
                end
                class EsimProfileInstance < InstanceResource
                    ##
                    # Initialize the EsimProfileInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this EsimProfile
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [EsimProfileInstance] EsimProfileInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'iccid' => payload['iccid'],
                            'sim_sid' => payload['sim_sid'],
                            'status' => payload['status'],
                            'eid' => payload['eid'],
                            'smdp_plus_address' => payload['smdp_plus_address'],
                            'matching_id' => payload['matching_id'],
                            'activation_code' => payload['activation_code'],
                            'error_code' => payload['error_code'],
                            'error_message' => payload['error_message'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [EsimProfileContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = EsimProfileContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the eSIM Profile resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) to which the eSIM Profile resource belongs.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The [ICCID](https://en.wikipedia.org/wiki/Subscriber_identity_module#ICCID) associated with the Sim resource.
                    def iccid
                        @properties['iccid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Sim](https://www.twilio.com/docs/wireless/api/sim-resource) resource that this eSIM Profile controls.
                    def sim_sid
                        @properties['sim_sid']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [String] Identifier of the eUICC that can claim the eSIM Profile.
                    def eid
                        @properties['eid']
                    end
                    
                    ##
                    # @return [String] Address of the SM-DP+ server from which the Profile will be downloaded. The URL will appear once the eSIM Profile reaches the status `available`.
                    def smdp_plus_address
                        @properties['smdp_plus_address']
                    end
                    
                    ##
                    # @return [String] Unique identifier of the eSIM profile that can be used to identify and download the eSIM profile from the SM-DP+ server. Populated if `generate_matching_id` is set to `true` when creating the eSIM profile reservation.
                    def matching_id
                        @properties['matching_id']
                    end
                    
                    ##
                    # @return [String] Combined machine-readable activation code for acquiring an eSIM Profile with the Activation Code download method. Can be used in a QR code to download an eSIM profile.
                    def activation_code
                        @properties['activation_code']
                    end
                    
                    ##
                    # @return [String] Code indicating the failure if the download of the SIM Profile failed and the eSIM Profile is in `failed` state.
                    def error_code
                        @properties['error_code']
                    end
                    
                    ##
                    # @return [String] Error message describing the failure if the download of the SIM Profile failed and the eSIM Profile is in `failed` state.
                    def error_message
                        @properties['error_message']
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
                    # @return [String] The absolute URL of the eSIM Profile resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the EsimProfileInstance
                    # @return [EsimProfileInstance] Fetched EsimProfileInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Supersim.V1.EsimProfileInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Supersim.V1.EsimProfileInstance #{values}>"
                    end
                end

            end
        end
    end
end
