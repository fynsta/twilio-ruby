##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Lookups
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Lookups < LookupsBase
            class V1 < Version
                class PhoneNumberList < ListResource
                
                    ##
                    # Initialize the PhoneNumberList
                    # @param [Version] version Version that contains the resource
                    # @return [PhoneNumberList] PhoneNumberList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        
                        
                    end
                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Lookups.V1.PhoneNumberList>'
                    end
                end


                class PhoneNumberContext < InstanceContext
                    ##
                    # Initialize the PhoneNumberContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] phone_number The phone number to lookup in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.
                    # @return [PhoneNumberContext] PhoneNumberContext
                    def initialize(version, phone_number)
                        super(version)

                        # Path Solution
                        @solution = { phone_number: phone_number,  }
                        @uri = "/PhoneNumbers/#{CGI.escape(@solution[:phone_number]).gsub("+", "%20")}"

                        
                    end
                    ##
                    # Fetch the PhoneNumberInstance
                    # @param [String] country_code The [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the phone number to fetch. This is used to specify the country when the phone number is provided in a national format.
                    # @param [Array[String]] type The type of information to return. Can be: `carrier` or `caller-name`. The default is null.  Carrier information costs $0.005 per phone number looked up.  Caller Name information is currently available only in the US and costs $0.01 per phone number looked up.  To retrieve both types on information, specify this parameter twice; once with `carrier` and once with `caller-name` as the value.
                    # @param [Array[String]] add_ons The `unique_name` of an Add-on you would like to invoke. Can be the `unique_name` of an Add-on that is installed on your account. You can specify multiple instances of this parameter to invoke multiple Add-ons. For more information about  Add-ons, see the [Add-ons documentation](https://www.twilio.com/docs/add-ons).
                    # @param [Hash] add_ons_data Data specific to the add-on you would like to invoke. The content and format of this value depends on the add-on.
                    # @return [PhoneNumberInstance] Fetched PhoneNumberInstance
                    def fetch(
                        country_code: :unset, 
                        type: :unset, 
                        add_ons: :unset, 
                        add_ons_data: :unset
                    )

                        params = Twilio::Values.of({
                            'CountryCode' => country_code,
                            'Type' => Twilio.serialize_list(type) { |e| e },
                            'AddOns' => Twilio.serialize_list(add_ons) { |e| e },
                        })
                        params.merge!(Twilio.prefixed_collapsible_map(add_ons_data, 'AddOns'))
                        
                        payload = @version.fetch('GET', @uri, params: params)
                        PhoneNumberInstance.new(
                            @version,
                            payload,
                            phone_number: @solution[:phone_number],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Lookups.V1.PhoneNumberContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Lookups.V1.PhoneNumberContext #{context}>"
                    end
                end

                class PhoneNumberPage < Page
                    ##
                    # Initialize the PhoneNumberPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [PhoneNumberPage] PhoneNumberPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of PhoneNumberInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [PhoneNumberInstance] PhoneNumberInstance
                    def get_instance(payload)
                        PhoneNumberInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Lookups.V1.PhoneNumberPage>'
                    end
                end
                class PhoneNumberInstance < InstanceResource
                    ##
                    # Initialize the PhoneNumberInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this PhoneNumber
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [PhoneNumberInstance] PhoneNumberInstance
                    def initialize(version, payload , phone_number: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'caller_name' => payload['caller_name'],
                            'country_code' => payload['country_code'],
                            'phone_number' => payload['phone_number'],
                            'national_format' => payload['national_format'],
                            'carrier' => payload['carrier'],
                            'add_ons' => payload['add_ons'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'phone_number' => phone_number  || @properties['phone_number']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [PhoneNumberContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = PhoneNumberContext.new(@version , @params['phone_number'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [Hash] The name of the phone number's owner. If `null`, that information was not available.
                    def caller_name
                        @properties['caller_name']
                    end
                    
                    ##
                    # @return [String] The [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) for the phone number.
                    def country_code
                        @properties['country_code']
                    end
                    
                    ##
                    # @return [String] The phone number in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.
                    def phone_number
                        @properties['phone_number']
                    end
                    
                    ##
                    # @return [String] The phone number, in national format.
                    def national_format
                        @properties['national_format']
                    end
                    
                    ##
                    # @return [Hash] The telecom company that provides the phone number.
                    def carrier
                        @properties['carrier']
                    end
                    
                    ##
                    # @return [Hash] A JSON string with the results of the Add-ons you specified in the `add_ons` parameters. For the format of the object, see [Using Add-ons](https://www.twilio.com/docs/add-ons).
                    def add_ons
                        @properties['add_ons']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the PhoneNumberInstance
                    # @param [String] country_code The [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the phone number to fetch. This is used to specify the country when the phone number is provided in a national format.
                    # @param [Array[String]] type The type of information to return. Can be: `carrier` or `caller-name`. The default is null.  Carrier information costs $0.005 per phone number looked up.  Caller Name information is currently available only in the US and costs $0.01 per phone number looked up.  To retrieve both types on information, specify this parameter twice; once with `carrier` and once with `caller-name` as the value.
                    # @param [Array[String]] add_ons The `unique_name` of an Add-on you would like to invoke. Can be the `unique_name` of an Add-on that is installed on your account. You can specify multiple instances of this parameter to invoke multiple Add-ons. For more information about  Add-ons, see the [Add-ons documentation](https://www.twilio.com/docs/add-ons).
                    # @param [Hash] add_ons_data Data specific to the add-on you would like to invoke. The content and format of this value depends on the add-on.
                    # @return [PhoneNumberInstance] Fetched PhoneNumberInstance
                    def fetch(
                        country_code: :unset, 
                        type: :unset, 
                        add_ons: :unset, 
                        add_ons_data: :unset
                    )

                        context.fetch(
                            country_code: country_code, 
                            type: type, 
                            add_ons: add_ons, 
                            add_ons_data: add_ons_data, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Lookups.V1.PhoneNumberInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Lookups.V1.PhoneNumberInstance #{values}>"
                    end
                end

            end
        end
    end
end
