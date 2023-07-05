##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Api
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Api < ApiBase
            class V2010 < Version
                class AccountContext < InstanceContext
                class IncomingPhoneNumberList < ListResource

                     class TollFreeList < ListResource
                    ##
                    # Initialize the TollFreeList
                    # @param [Version] version Version that contains the resource
                    # @return [TollFreeList] TollFreeList
                    def initialize(version, account_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { account_sid: account_sid }
                        @uri = "/Accounts/#{@solution[:account_sid]}/IncomingPhoneNumbers/TollFree.json"
                        
                    end
                    ##
                    # Create the TollFreeInstance
                    # @param [String] phone_number The phone number to purchase specified in [E.164](https://www.twilio.com/docs/glossary/what-e164) format.  E.164 phone numbers consist of a + followed by the country code and subscriber number without punctuation characters. For example, +14155551234.
                    # @param [String] api_version The API version to use for incoming calls made to the new phone number. The default is `2010-04-01`.
                    # @param [String] friendly_name A descriptive string that you created to describe the new phone number. It can be up to 64 characters long. By default, this is a formatted version of the phone number.
                    # @param [String] sms_application_sid The SID of the application that should handle SMS messages sent to the new phone number. If an `sms_application_sid` is present, we ignore all `sms_*_url` values and use those of the application.
                    # @param [String] sms_fallback_method The HTTP method that we should use to call `sms_fallback_url`. Can be: `GET` or `POST` and defaults to `POST`.
                    # @param [String] sms_fallback_url The URL that we should call when an error occurs while requesting or executing the TwiML defined by `sms_url`.
                    # @param [String] sms_method The HTTP method that we should use to call `sms_url`. Can be: `GET` or `POST` and defaults to `POST`.
                    # @param [String] sms_url The URL we should call when the new phone number receives an incoming SMS message.
                    # @param [String] status_callback The URL we should call using the `status_callback_method` to send status information to your application.
                    # @param [String] status_callback_method The HTTP method we should use to call `status_callback`. Can be: `GET` or `POST` and defaults to `POST`.
                    # @param [String] voice_application_sid The SID of the application we should use to handle calls to the new phone number. If a `voice_application_sid` is present, we ignore all of the voice urls and use those set on the application. Setting a `voice_application_sid` will automatically delete your `trunk_sid` and vice versa.
                    # @param [Boolean] voice_caller_id_lookup Whether to lookup the caller's name from the CNAM database and post it to your app. Can be: `true` or `false` and defaults to `false`.
                    # @param [String] voice_fallback_method The HTTP method that we should use to call `voice_fallback_url`. Can be: `GET` or `POST` and defaults to `POST`.
                    # @param [String] voice_fallback_url The URL that we should call when an error occurs retrieving or executing the TwiML requested by `url`.
                    # @param [String] voice_method The HTTP method that we should use to call `voice_url`. Can be: `GET` or `POST` and defaults to `POST`.
                    # @param [String] voice_url The URL that we should call to answer a call to the new phone number. The `voice_url` will not be called if a `voice_application_sid` or a `trunk_sid` is set.
                    # @param [String] identity_sid The SID of the Identity resource that we should associate with the new phone number. Some regions require an Identity to meet local regulations.
                    # @param [String] address_sid The SID of the Address resource we should associate with the new phone number. Some regions require addresses to meet local regulations.
                    # @param [EmergencyStatus] emergency_status 
                    # @param [String] emergency_address_sid The SID of the emergency address configuration to use for emergency calling from the new phone number.
                    # @param [String] trunk_sid The SID of the Trunk we should use to handle calls to the new phone number. If a `trunk_sid` is present, we ignore all of the voice urls and voice applications and use only those set on the Trunk. Setting a `trunk_sid` will automatically delete your `voice_application_sid` and vice versa.
                    # @param [VoiceReceiveMode] voice_receive_mode 
                    # @param [String] bundle_sid The SID of the Bundle resource that you associate with the phone number. Some regions require a Bundle to meet local Regulations.
                    # @return [TollFreeInstance] Created TollFreeInstance
                    def create(
                        phone_number: nil, 
                        api_version: :unset, 
                        friendly_name: :unset, 
                        sms_application_sid: :unset, 
                        sms_fallback_method: :unset, 
                        sms_fallback_url: :unset, 
                        sms_method: :unset, 
                        sms_url: :unset, 
                        status_callback: :unset, 
                        status_callback_method: :unset, 
                        voice_application_sid: :unset, 
                        voice_caller_id_lookup: :unset, 
                        voice_fallback_method: :unset, 
                        voice_fallback_url: :unset, 
                        voice_method: :unset, 
                        voice_url: :unset, 
                        identity_sid: :unset, 
                        address_sid: :unset, 
                        emergency_status: :unset, 
                        emergency_address_sid: :unset, 
                        trunk_sid: :unset, 
                        voice_receive_mode: :unset, 
                        bundle_sid: :unset
                    )

                        data = Twilio::Values.of({
                            'PhoneNumber' => phone_number,
                            'ApiVersion' => api_version,
                            'FriendlyName' => friendly_name,
                            'SmsApplicationSid' => sms_application_sid,
                            'SmsFallbackMethod' => sms_fallback_method,
                            'SmsFallbackUrl' => sms_fallback_url,
                            'SmsMethod' => sms_method,
                            'SmsUrl' => sms_url,
                            'StatusCallback' => status_callback,
                            'StatusCallbackMethod' => status_callback_method,
                            'VoiceApplicationSid' => voice_application_sid,
                            'VoiceCallerIdLookup' => voice_caller_id_lookup,
                            'VoiceFallbackMethod' => voice_fallback_method,
                            'VoiceFallbackUrl' => voice_fallback_url,
                            'VoiceMethod' => voice_method,
                            'VoiceUrl' => voice_url,
                            'IdentitySid' => identity_sid,
                            'AddressSid' => address_sid,
                            'EmergencyStatus' => emergency_status,
                            'EmergencyAddressSid' => emergency_address_sid,
                            'TrunkSid' => trunk_sid,
                            'VoiceReceiveMode' => voice_receive_mode,
                            'BundleSid' => bundle_sid,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        TollFreeInstance.new(
                            @version,
                            payload,
                            account_sid: @solution[:account_sid],
                        )
                    end

                
                    ##
                    # Lists TollFreeInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Boolean] beta Whether to include phone numbers new to the Twilio platform. Can be: `true` or `false` and the default is `true`.
                    # @param [String] friendly_name A string that identifies the resources to read.
                    # @param [String] phone_number The phone numbers of the IncomingPhoneNumber resources to read. You can specify partial numbers and use '*' as a wildcard for any digit.
                    # @param [String] origin Whether to include phone numbers based on their origin. Can be: `twilio` or `hosted`. By default, phone numbers of all origin are included.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(beta: :unset, friendly_name: :unset, phone_number: :unset, origin: :unset, limit: nil, page_size: nil)
                        self.stream(
                            beta: beta,
                            friendly_name: friendly_name,
                            phone_number: phone_number,
                            origin: origin,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Boolean] beta Whether to include phone numbers new to the Twilio platform. Can be: `true` or `false` and the default is `true`.
                    # @param [String] friendly_name A string that identifies the resources to read.
                    # @param [String] phone_number The phone numbers of the IncomingPhoneNumber resources to read. You can specify partial numbers and use '*' as a wildcard for any digit.
                    # @param [String] origin Whether to include phone numbers based on their origin. Can be: `twilio` or `hosted`. By default, phone numbers of all origin are included.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(beta: :unset, friendly_name: :unset, phone_number: :unset, origin: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            beta: beta,
                            friendly_name: friendly_name,
                            phone_number: phone_number,
                            origin: origin,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields TollFreeInstance records from the API.
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
                    # Retrieve a single page of TollFreeInstance records from the API.
                    # Request is executed immediately.
                    # @param [Boolean] beta Whether to include phone numbers new to the Twilio platform. Can be: `true` or `false` and the default is `true`.
                    # @param [String] friendly_name A string that identifies the resources to read.
                    # @param [String] phone_number The phone numbers of the IncomingPhoneNumber resources to read. You can specify partial numbers and use '*' as a wildcard for any digit.
                    # @param [String] origin Whether to include phone numbers based on their origin. Can be: `twilio` or `hosted`. By default, phone numbers of all origin are included.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of TollFreeInstance
                    def page(beta: :unset, friendly_name: :unset, phone_number: :unset, origin: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            Beta' => beta,
                            
                            FriendlyName' => friendly_name,
                            
                            PhoneNumber' => phone_number,
                            
                            Origin' => origin,
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        TollFreePage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of TollFreeInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of TollFreeInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    TollFreePage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Api.V2010.TollFreeList>'
                    end
                end

                class TollFreePage < Page
                    ##
                    # Initialize the TollFreePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [TollFreePage] TollFreePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of TollFreeInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [TollFreeInstance] TollFreeInstance
                    def get_instance(payload)
                        TollFreeInstance.new(@version, payload, account_sid: @solution[:account_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Api.V2010.TollFreePage>'
                    end
                end
                class TollFreeInstance < InstanceResource
                    ##
                    # Initialize the TollFreeInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this TollFree
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [TollFreeInstance] TollFreeInstance
                    def initialize(version, payload , account_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'address_sid' => payload['address_sid'],
                            'address_requirements' => payload['address_requirements'],
                            'api_version' => payload['api_version'],
                            'beta' => payload['beta'],
                            'capabilities' => payload['capabilities'],
                            'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                            'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                            'friendly_name' => payload['friendly_name'],
                            'identity_sid' => payload['identity_sid'],
                            'phone_number' => payload['phone_number'],
                            'origin' => payload['origin'],
                            'sid' => payload['sid'],
                            'sms_application_sid' => payload['sms_application_sid'],
                            'sms_fallback_method' => payload['sms_fallback_method'],
                            'sms_fallback_url' => payload['sms_fallback_url'],
                            'sms_method' => payload['sms_method'],
                            'sms_url' => payload['sms_url'],
                            'status_callback' => payload['status_callback'],
                            'status_callback_method' => payload['status_callback_method'],
                            'trunk_sid' => payload['trunk_sid'],
                            'uri' => payload['uri'],
                            'voice_receive_mode' => payload['voice_receive_mode'],
                            'voice_application_sid' => payload['voice_application_sid'],
                            'voice_caller_id_lookup' => payload['voice_caller_id_lookup'],
                            'voice_fallback_method' => payload['voice_fallback_method'],
                            'voice_fallback_url' => payload['voice_fallback_url'],
                            'voice_method' => payload['voice_method'],
                            'voice_url' => payload['voice_url'],
                            'emergency_status' => payload['emergency_status'],
                            'emergency_address_sid' => payload['emergency_address_sid'],
                            'emergency_address_status' => payload['emergency_address_status'],
                            'bundle_sid' => payload['bundle_sid'],
                            'status' => payload['status'],
                        }
                    end

                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Address resource associated with the phone number.
                    def address_sid
                        @properties['address_sid']
                    end
                    
                    ##
                    # @return [AddressRequirement] 
                    def address_requirements
                        @properties['address_requirements']
                    end
                    
                    ##
                    # @return [String] The API version used to start a new TwiML session.
                    def api_version
                        @properties['api_version']
                    end
                    
                    ##
                    # @return [Boolean] Whether the phone number is new to the Twilio platform. Can be: `true` or `false`.
                    def beta
                        @properties['beta']
                    end
                    
                    ##
                    # @return [ApiV2010AccountIncomingPhoneNumberCapabilities] 
                    def capabilities
                        @properties['capabilities']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the resource.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] The SID of the Identity resource that we associate with the phone number. Some regions require an Identity to meet local regulations.
                    def identity_sid
                        @properties['identity_sid']
                    end
                    
                    ##
                    # @return [String] The phone number in [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists of a + followed by the country code and subscriber number.
                    def phone_number
                        @properties['phone_number']
                    end
                    
                    ##
                    # @return [String] The phone number's origin. `twilio` identifies Twilio-owned phone numbers and `hosted` identifies hosted phone numbers.
                    def origin
                        @properties['origin']
                    end
                    
                    ##
                    # @return [String] The unique string that that we created to identify the resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the application that handles SMS messages sent to the phone number. If an `sms_application_sid` is present, we ignore all `sms_*_url` values and use those of the application.
                    def sms_application_sid
                        @properties['sms_application_sid']
                    end
                    
                    ##
                    # @return [String] The HTTP method we use to call `sms_fallback_url`. Can be: `GET` or `POST`.
                    def sms_fallback_method
                        @properties['sms_fallback_method']
                    end
                    
                    ##
                    # @return [String] The URL that we call when an error occurs while retrieving or executing the TwiML from `sms_url`.
                    def sms_fallback_url
                        @properties['sms_fallback_url']
                    end
                    
                    ##
                    # @return [String] The HTTP method we use to call `sms_url`. Can be: `GET` or `POST`.
                    def sms_method
                        @properties['sms_method']
                    end
                    
                    ##
                    # @return [String] The URL we call when the phone number receives an incoming SMS message.
                    def sms_url
                        @properties['sms_url']
                    end
                    
                    ##
                    # @return [String] The URL we call using the `status_callback_method` to send status information to your application.
                    def status_callback
                        @properties['status_callback']
                    end
                    
                    ##
                    # @return [String] The HTTP method we use to call `status_callback`. Can be: `GET` or `POST`.
                    def status_callback_method
                        @properties['status_callback_method']
                    end
                    
                    ##
                    # @return [String] The SID of the Trunk that handles calls to the phone number. If a `trunk_sid` is present, we ignore all of the voice urls and voice applications and use those set on the Trunk. Setting a `trunk_sid` will automatically delete your `voice_application_sid` and vice versa.
                    def trunk_sid
                        @properties['trunk_sid']
                    end
                    
                    ##
                    # @return [String] The URI of the resource, relative to `https://api.twilio.com`.
                    def uri
                        @properties['uri']
                    end
                    
                    ##
                    # @return [VoiceReceiveMode] 
                    def voice_receive_mode
                        @properties['voice_receive_mode']
                    end
                    
                    ##
                    # @return [String] The SID of the application that handles calls to the phone number. If a `voice_application_sid` is present, we ignore all of the voice urls and use those set on the application. Setting a `voice_application_sid` will automatically delete your `trunk_sid` and vice versa.
                    def voice_application_sid
                        @properties['voice_application_sid']
                    end
                    
                    ##
                    # @return [Boolean] Whether we look up the caller's caller-ID name from the CNAM database ($0.01 per look up). Can be: `true` or `false`.
                    def voice_caller_id_lookup
                        @properties['voice_caller_id_lookup']
                    end
                    
                    ##
                    # @return [String] The HTTP method we use to call `voice_fallback_url`. Can be: `GET` or `POST`.
                    def voice_fallback_method
                        @properties['voice_fallback_method']
                    end
                    
                    ##
                    # @return [String] The URL that we call when an error occurs retrieving or executing the TwiML requested by `url`.
                    def voice_fallback_url
                        @properties['voice_fallback_url']
                    end
                    
                    ##
                    # @return [String] The HTTP method we use to call `voice_url`. Can be: `GET` or `POST`.
                    def voice_method
                        @properties['voice_method']
                    end
                    
                    ##
                    # @return [String] The URL we call when the phone number receives a call. The `voice_url` will not be used if a `voice_application_sid` or a `trunk_sid` is set.
                    def voice_url
                        @properties['voice_url']
                    end
                    
                    ##
                    # @return [EmergencyStatus] 
                    def emergency_status
                        @properties['emergency_status']
                    end
                    
                    ##
                    # @return [String] The SID of the emergency address configuration that we use for emergency calling from this phone number.
                    def emergency_address_sid
                        @properties['emergency_address_sid']
                    end
                    
                    ##
                    # @return [EmergencyAddressStatus] 
                    def emergency_address_status
                        @properties['emergency_address_status']
                    end
                    
                    ##
                    # @return [String] The SID of the Bundle resource that you associate with the phone number. Some regions require a Bundle to meet local Regulations.
                    def bundle_sid
                        @properties['bundle_sid']
                    end
                    
                    ##
                    # @return [String] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Api.V2010.TollFreeInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Api.V2010.TollFreeInstance>"
                    end
                end

             end
             end
            end
        end
    end
end


