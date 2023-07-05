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
                class SimContext < InstanceContext

                     class BillingPeriodList < ListResource
                    ##
                    # Initialize the BillingPeriodList
                    # @param [Version] version Version that contains the resource
                    # @return [BillingPeriodList] BillingPeriodList
                    def initialize(version, sim_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { sim_sid: sim_sid }
                        @uri = "/Sims/#{@solution[:sim_sid]}/BillingPeriods"
                        
                    end
                
                    ##
                    # Lists BillingPeriodInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(limit: nil, page_size: nil)
                        self.stream(
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields BillingPeriodInstance records from the API.
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
                    # Retrieve a single page of BillingPeriodInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of BillingPeriodInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        BillingPeriodPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of BillingPeriodInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of BillingPeriodInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    BillingPeriodPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Supersim.V1.BillingPeriodList>'
                    end
                end

                class BillingPeriodPage < Page
                    ##
                    # Initialize the BillingPeriodPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [BillingPeriodPage] BillingPeriodPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of BillingPeriodInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [BillingPeriodInstance] BillingPeriodInstance
                    def get_instance(payload)
                        BillingPeriodInstance.new(@version, payload, sim_sid: @solution[:sim_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Supersim.V1.BillingPeriodPage>'
                    end
                end
                class BillingPeriodInstance < InstanceResource
                    ##
                    # Initialize the BillingPeriodInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this BillingPeriod
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [BillingPeriodInstance] BillingPeriodInstance
                    def initialize(version, payload , sim_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'sim_sid' => payload['sim_sid'],
                            'start_time' => Twilio.deserialize_iso8601_datetime(payload['start_time']),
                            'end_time' => Twilio.deserialize_iso8601_datetime(payload['end_time']),
                            'period_type' => payload['period_type'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                        }
                    end

                    
                    ##
                    # @return [String] The SID of the Billing Period.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) the Super SIM belongs to.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Super SIM the Billing Period belongs to.
                    def sim_sid
                        @properties['sim_sid']
                    end
                    
                    ##
                    # @return [Time] The start time of the Billing Period specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def start_time
                        @properties['start_time']
                    end
                    
                    ##
                    # @return [Time] The end time of the Billing Period specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def end_time
                        @properties['end_time']
                    end
                    
                    ##
                    # @return [BpType] 
                    def period_type
                        @properties['period_type']
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
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Supersim.V1.BillingPeriodInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Supersim.V1.BillingPeriodInstance>"
                    end
                end

             end
            end
        end
    end
end


