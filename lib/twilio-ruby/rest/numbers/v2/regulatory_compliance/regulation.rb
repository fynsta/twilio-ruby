##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Numbers
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Numbers < NumbersBase
            class V2 < Version
                class RegulatoryComplianceList < ListResource

                     class RegulationList < ListResource
                
                    ##
                    # Initialize the RegulationList
                    # @param [Version] version Version that contains the resource
                    # @return [RegulationList] RegulationList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/RegulatoryCompliance/Regulations"
                        
                    end
                
                    ##
                    # Lists RegulationInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [EndUserType] end_user_type The type of End User the regulation requires - can be `individual` or `business`.
                    # @param [String] iso_country The ISO country code of the phone number's country.
                    # @param [String] number_type The type of phone number that the regulatory requiremnt is restricting.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(end_user_type: :unset, iso_country: :unset, number_type: :unset, limit: nil, page_size: nil)
                        self.stream(
                            end_user_type: end_user_type,
                            iso_country: iso_country,
                            number_type: number_type,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [EndUserType] end_user_type The type of End User the regulation requires - can be `individual` or `business`.
                    # @param [String] iso_country The ISO country code of the phone number's country.
                    # @param [String] number_type The type of phone number that the regulatory requiremnt is restricting.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(end_user_type: :unset, iso_country: :unset, number_type: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            end_user_type: end_user_type,
                            iso_country: iso_country,
                            number_type: number_type,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields RegulationInstance records from the API.
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
                    # Retrieve a single page of RegulationInstance records from the API.
                    # Request is executed immediately.
                    # @param [EndUserType] end_user_type The type of End User the regulation requires - can be `individual` or `business`.
                    # @param [String] iso_country The ISO country code of the phone number's country.
                    # @param [String] number_type The type of phone number that the regulatory requiremnt is restricting.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of RegulationInstance
                    def page(end_user_type: :unset, iso_country: :unset, number_type: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'EndUserType' => end_user_type,
                            'IsoCountry' => iso_country,
                            'NumberType' => number_type,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        RegulationPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of RegulationInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of RegulationInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    RegulationPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Numbers.V2.RegulationList>'
                    end
                end


                class RegulationContext < InstanceContext
                    ##
                    # Initialize the RegulationContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The unique string that identifies the Regulation resource.
                    # @return [RegulationContext] RegulationContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/RegulatoryCompliance/Regulations/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Fetch the RegulationInstance
                    # @return [RegulationInstance] Fetched RegulationInstance
                    def fetch

                        
                        payload = @version.fetch('GET', @uri)
                        RegulationInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Numbers.V2.RegulationContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Numbers.V2.RegulationContext #{context}>"
                    end
                end

                class RegulationPage < Page
                    ##
                    # Initialize the RegulationPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [RegulationPage] RegulationPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of RegulationInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [RegulationInstance] RegulationInstance
                    def get_instance(payload)
                        RegulationInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Numbers.V2.RegulationPage>'
                    end
                end
                class RegulationInstance < InstanceResource
                    ##
                    # Initialize the RegulationInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Regulation
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [RegulationInstance] RegulationInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'friendly_name' => payload['friendly_name'],
                            'iso_country' => payload['iso_country'],
                            'number_type' => payload['number_type'],
                            'end_user_type' => payload['end_user_type'],
                            'requirements' => payload['requirements'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [RegulationContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = RegulationContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that identifies the Regulation resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] A human-readable description that is assigned to describe the Regulation resource. Examples can include Germany: Mobile - Business.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] The ISO country code of the phone number's country.
                    def iso_country
                        @properties['iso_country']
                    end
                    
                    ##
                    # @return [String] The type of phone number restricted by the regulatory requirement. For example, Germany mobile phone numbers provisioned by businesses require a business name with commercial register proof from the Handelsregisterauszug and a proof of address from Handelsregisterauszug or a trade license by Gewerbeanmeldung.
                    def number_type
                        @properties['number_type']
                    end
                    
                    ##
                    # @return [EndUserType] 
                    def end_user_type
                        @properties['end_user_type']
                    end
                    
                    ##
                    # @return [Hash] The SID of an object that holds the regulatory information of the phone number country, phone number type, and end user type.
                    def requirements
                        @properties['requirements']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the Regulation resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the RegulationInstance
                    # @return [RegulationInstance] Fetched RegulationInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Numbers.V2.RegulationInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Numbers.V2.RegulationInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


