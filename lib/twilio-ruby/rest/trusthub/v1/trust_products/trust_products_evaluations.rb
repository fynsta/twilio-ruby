##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Trusthub
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Trusthub < TrusthubBase
            class V1 < Version
                class TrustProductsContext < InstanceContext

                     class TrustProductsEvaluationsList < ListResource
                    ##
                    # Initialize the TrustProductsEvaluationsList
                    # @param [Version] version Version that contains the resource
                    # @return [TrustProductsEvaluationsList] TrustProductsEvaluationsList
                    def initialize(version, trust_product_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { trust_product_sid: trust_product_sid }
                        @uri = "/TrustProducts/#{@solution[:trust_product_sid]}/Evaluations"
                        
                    end
                    ##
                    # Create the TrustProductsEvaluationsInstance
                    # @param [String] policy_sid The unique string of a policy that is associated to the customer_profile resource.
                    # @return [TrustProductsEvaluationsInstance] Created TrustProductsEvaluationsInstance
                    def create(
                        policy_sid: nil
                    )

                        data = Twilio::Values.of({
                            'PolicySid' => policy_sid,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        TrustProductsEvaluationsInstance.new(
                            @version,
                            payload,
                            trust_product_sid: @solution[:trust_product_sid],
                        )
                    end

                
                    ##
                    # Lists TrustProductsEvaluationsInstance records from the API as a list.
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
                    # When passed a block, yields TrustProductsEvaluationsInstance records from the API.
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
                    # Retrieve a single page of TrustProductsEvaluationsInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of TrustProductsEvaluationsInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        TrustProductsEvaluationsPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of TrustProductsEvaluationsInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of TrustProductsEvaluationsInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    TrustProductsEvaluationsPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Trusthub.V1.TrustProductsEvaluationsList>'
                    end
                end


                class TrustProductsEvaluationsContext < InstanceContext
                    ##
                    # Initialize the TrustProductsEvaluationsContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] trust_product_sid The unique string that we created to identify the trust_product resource.
                    # @param [String] sid The unique string that identifies the Evaluation resource.
                    # @return [TrustProductsEvaluationsContext] TrustProductsEvaluationsContext
                    def initialize(version, trust_product_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { trust_product_sid: trust_product_sid, sid: sid,  }
                        @uri = "/TrustProducts/#{@solution[:trust_product_sid]}/Evaluations/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Fetch the TrustProductsEvaluationsInstance
                    # @return [TrustProductsEvaluationsInstance] Fetched TrustProductsEvaluationsInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        TrustProductsEvaluationsInstance.new(
                            @version,
                            payload,
                            trust_product_sid: @solution[:trust_product_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Trusthub.V1.TrustProductsEvaluationsContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Trusthub.V1.TrustProductsEvaluationsContext #{context}>"
                    end
                end

                class TrustProductsEvaluationsPage < Page
                    ##
                    # Initialize the TrustProductsEvaluationsPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [TrustProductsEvaluationsPage] TrustProductsEvaluationsPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of TrustProductsEvaluationsInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [TrustProductsEvaluationsInstance] TrustProductsEvaluationsInstance
                    def get_instance(payload)
                        TrustProductsEvaluationsInstance.new(@version, payload, trust_product_sid: @solution[:trust_product_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Trusthub.V1.TrustProductsEvaluationsPage>'
                    end
                end
                class TrustProductsEvaluationsInstance < InstanceResource
                    ##
                    # Initialize the TrustProductsEvaluationsInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this TrustProductsEvaluations
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [TrustProductsEvaluationsInstance] TrustProductsEvaluationsInstance
                    def initialize(version, payload , trust_product_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'policy_sid' => payload['policy_sid'],
                            'trust_product_sid' => payload['trust_product_sid'],
                            'status' => payload['status'],
                            'results' => payload['results'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'trust_product_sid' => trust_product_sid  || @properties['trust_product_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [TrustProductsEvaluationsContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = TrustProductsEvaluationsContext.new(@version , @params['trust_product_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that identifies the Evaluation resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the trust_product resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The unique string of a policy that is associated to the trust_product resource.
                    def policy_sid
                        @properties['policy_sid']
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the trust_product resource.
                    def trust_product_sid
                        @properties['trust_product_sid']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [Array<Hash>] The results of the Evaluation which includes the valid and invalid attributes.
                    def results
                        @properties['results']
                    end
                    
                    ##
                    # @return [Time] 
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the TrustProductsEvaluationsInstance
                    # @return [TrustProductsEvaluationsInstance] Fetched TrustProductsEvaluationsInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Trusthub.V1.TrustProductsEvaluationsInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Trusthub.V1.TrustProductsEvaluationsInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


