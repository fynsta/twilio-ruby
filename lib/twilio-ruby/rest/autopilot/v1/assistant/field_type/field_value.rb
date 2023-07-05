##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Autopilot
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Autopilot < AutopilotBase
            class V1 < Version
                class AssistantContext < InstanceContext
                class FieldTypeContext < InstanceContext

                     class FieldValueList < ListResource
                    ##
                    # Initialize the FieldValueList
                    # @param [Version] version Version that contains the resource
                    # @return [FieldValueList] FieldValueList
                    def initialize(version, assistant_sid: nil, field_type_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { assistant_sid: assistant_sid, field_type_sid: field_type_sid }
                        @uri = "/Assistants/#{@solution[:assistant_sid]}/FieldTypes/#{@solution[:field_type_sid]}/FieldValues"
                        
                    end
                    ##
                    # Create the FieldValueInstance
                    # @param [String] language The [ISO language-country](https://docs.oracle.com/cd/E13214_01/wli/docs92/xref/xqisocodes.html) tag that specifies the language of the value. Currently supported tags: `en-US`
                    # @param [String] value The Field Value data.
                    # @param [String] synonym_of The string value that indicates which word the field value is a synonym of.
                    # @return [FieldValueInstance] Created FieldValueInstance
                    def create(
                        language: nil, 
                        value: nil, 
                        synonym_of: :unset
                    )

                        data = Twilio::Values.of({
                            'Language' => language,
                            'Value' => value,
                            'SynonymOf' => synonym_of,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        FieldValueInstance.new(
                            @version,
                            payload,
                            assistant_sid: @solution[:assistant_sid],
                            field_type_sid: @solution[:field_type_sid],
                        )
                    end

                
                    ##
                    # Lists FieldValueInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] language The [ISO language-country](https://docs.oracle.com/cd/E13214_01/wli/docs92/xref/xqisocodes.html) tag that specifies the language of the value. Currently supported tags: `en-US`
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(language: :unset, limit: nil, page_size: nil)
                        self.stream(
                            language: language,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] language The [ISO language-country](https://docs.oracle.com/cd/E13214_01/wli/docs92/xref/xqisocodes.html) tag that specifies the language of the value. Currently supported tags: `en-US`
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(language: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            language: language,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields FieldValueInstance records from the API.
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
                    # Retrieve a single page of FieldValueInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] language The [ISO language-country](https://docs.oracle.com/cd/E13214_01/wli/docs92/xref/xqisocodes.html) tag that specifies the language of the value. Currently supported tags: `en-US`
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of FieldValueInstance
                    def page(language: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            Language' => language,
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        FieldValuePage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of FieldValueInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of FieldValueInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    FieldValuePage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Autopilot.V1.FieldValueList>'
                    end
                end


                ##
                #PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
                class FieldValueContext < InstanceContext
                    ##
                    # Initialize the FieldValueContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] assistant_sid The SID of the [Assistant](https://www.twilio.com/docs/autopilot/api/assistant) that is the parent of the FieldType associated with the resource to fetch.
                    # @param [String] field_type_sid The SID of the Field Type associated with the Field Value to fetch.
                    # @param [String] sid The Twilio-provided string that uniquely identifies the FieldValue resource to fetch.
                    # @return [FieldValueContext] FieldValueContext
                    def initialize(version, assistant_sid, field_type_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { assistant_sid: assistant_sid, field_type_sid: field_type_sid, sid: sid,  }
                        @uri = "/Assistants/#{@solution[:assistant_sid]}/FieldTypes/#{@solution[:field_type_sid]}/FieldValues/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Delete the FieldValueInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the FieldValueInstance
                    # @return [FieldValueInstance] Fetched FieldValueInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        FieldValueInstance.new(
                            @version,
                            payload,
                            assistant_sid: @solution[:assistant_sid],
                            field_type_sid: @solution[:field_type_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Autopilot.V1.FieldValueContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Autopilot.V1.FieldValueContext #{context}>"
                    end
                end

                class FieldValuePage < Page
                    ##
                    # Initialize the FieldValuePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [FieldValuePage] FieldValuePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of FieldValueInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [FieldValueInstance] FieldValueInstance
                    def get_instance(payload)
                        FieldValueInstance.new(@version, payload, assistant_sid: @solution[:assistant_sid], field_type_sid: @solution[:field_type_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Autopilot.V1.FieldValuePage>'
                    end
                end
                class FieldValueInstance < InstanceResource
                    ##
                    # Initialize the FieldValueInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this FieldValue
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [FieldValueInstance] FieldValueInstance
                    def initialize(version, payload , assistant_sid: nil, field_type_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'field_type_sid' => payload['field_type_sid'],
                            'language' => payload['language'],
                            'assistant_sid' => payload['assistant_sid'],
                            'sid' => payload['sid'],
                            'value' => payload['value'],
                            'url' => payload['url'],
                            'synonym_of' => payload['synonym_of'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'assistant_sid' => assistant_sid  || @properties['assistant_sid']  ,'field_type_sid' => field_type_sid  || @properties['field_type_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [FieldValueContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = FieldValueContext.new(@version , @params['assistant_sid'], @params['field_type_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the FieldValue resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The SID of the Field Type associated with the Field Value.
                    def field_type_sid
                        @properties['field_type_sid']
                    end
                    
                    ##
                    # @return [String] The [ISO language-country](https://docs.oracle.com/cd/E13214_01/wli/docs92/xref/xqisocodes.html) tag that specifies the language of the value. Currently supported tags: `en-US`
                    def language
                        @properties['language']
                    end
                    
                    ##
                    # @return [String] The SID of the [Assistant](https://www.twilio.com/docs/autopilot/api/assistant) that is the parent of the FieldType associated with the resource.
                    def assistant_sid
                        @properties['assistant_sid']
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the FieldValue resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The Field Value data.
                    def value
                        @properties['value']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the FieldValue resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [String] The word for which the field value is a synonym of.
                    def synonym_of
                        @properties['synonym_of']
                    end
                    
                    ##
                    # Delete the FieldValueInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the FieldValueInstance
                    # @return [FieldValueInstance] Fetched FieldValueInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Autopilot.V1.FieldValueInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Autopilot.V1.FieldValueInstance #{values}>"
                    end
                end

             end
             end
            end
        end
    end
end


