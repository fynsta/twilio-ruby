##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Wireless
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Wireless < WirelessBase
            class V1 < Version
                class SimContext < InstanceContext

                     class UsageRecordList < ListResource
                    ##
                    # Initialize the UsageRecordList
                    # @param [Version] version Version that contains the resource
                    # @return [UsageRecordList] UsageRecordList
                    def initialize(version, sim_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { sim_sid: sim_sid }
                        @uri = "/Sims/#{@solution[:sim_sid]}/UsageRecords"
                        
                    end
                
                    ##
                    # Lists UsageRecordInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Time] end_ Only include usage that occurred on or before this date, specified in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html). The default is the current time.
                    # @param [Time] start Only include usage that has occurred on or after this date, specified in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html). The default is one month before the `end` parameter value.
                    # @param [Granularity] granularity How to summarize the usage by time. Can be: `daily`, `hourly`, or `all`. The default is `all`. A value of `all` returns one Usage Record that describes the usage for the entire period.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(end_: :unset, start: :unset, granularity: :unset, limit: nil, page_size: nil)
                        self.stream(
                            end_: end_,
                            start: start,
                            granularity: granularity,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Time] end_ Only include usage that occurred on or before this date, specified in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html). The default is the current time.
                    # @param [Time] start Only include usage that has occurred on or after this date, specified in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html). The default is one month before the `end` parameter value.
                    # @param [Granularity] granularity How to summarize the usage by time. Can be: `daily`, `hourly`, or `all`. The default is `all`. A value of `all` returns one Usage Record that describes the usage for the entire period.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(end_: :unset, start: :unset, granularity: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            end_: end_,
                            start: start,
                            granularity: granularity,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields UsageRecordInstance records from the API.
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
                    # Retrieve a single page of UsageRecordInstance records from the API.
                    # Request is executed immediately.
                    # @param [Time] end_ Only include usage that occurred on or before this date, specified in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html). The default is the current time.
                    # @param [Time] start Only include usage that has occurred on or after this date, specified in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html). The default is one month before the `end` parameter value.
                    # @param [Granularity] granularity How to summarize the usage by time. Can be: `daily`, `hourly`, or `all`. The default is `all`. A value of `all` returns one Usage Record that describes the usage for the entire period.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of UsageRecordInstance
                    def page(end_: :unset, start: :unset, granularity: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'End' =>  Twilio.serialize_iso8601_datetime(end_),
                                                        
                            'Start' =>  Twilio.serialize_iso8601_datetime(start),
                                                        
                            Granularity' => granularity,
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        UsageRecordPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of UsageRecordInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of UsageRecordInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    UsageRecordPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Wireless.V1.UsageRecordList>'
                    end
                end

                class UsageRecordPage < Page
                    ##
                    # Initialize the UsageRecordPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [UsageRecordPage] UsageRecordPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of UsageRecordInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [UsageRecordInstance] UsageRecordInstance
                    def get_instance(payload)
                        UsageRecordInstance.new(@version, payload, sim_sid: @solution[:sim_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Wireless.V1.UsageRecordPage>'
                    end
                end
                class UsageRecordInstance < InstanceResource
                    ##
                    # Initialize the UsageRecordInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this UsageRecord
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [UsageRecordInstance] UsageRecordInstance
                    def initialize(version, payload , sim_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sim_sid' => payload['sim_sid'],
                            'account_sid' => payload['account_sid'],
                            'period' => payload['period'],
                            'commands' => payload['commands'],
                            'data' => payload['data'],
                        }
                    end

                    
                    ##
                    # @return [String] The SID of the [Sim resource](https://www.twilio.com/docs/wireless/api/sim-resource) that this Usage Record is for.
                    def sim_sid
                        @properties['sim_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the UsageRecord resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [Hash] The time period for which the usage is reported. Contains `start` and `end` datetime values given as GMT in [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format.
                    def period
                        @properties['period']
                    end
                    
                    ##
                    # @return [Hash] An object that describes the SIM's usage of Commands during the specified period. See [Commands Usage Object](https://www.twilio.com/docs/wireless/api/sim-usagerecord-resource#commands-usage-object).
                    def commands
                        @properties['commands']
                    end
                    
                    ##
                    # @return [Hash] An object that describes the SIM's data usage during the specified period. See [Data Usage Object](https://www.twilio.com/docs/wireless/api/sim-usagerecord-resource#data-usage-object).
                    def data
                        @properties['data']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Wireless.V1.UsageRecordInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Wireless.V1.UsageRecordInstance>"
                    end
                end

             end
            end
        end
    end
end


