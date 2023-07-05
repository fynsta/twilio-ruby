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
                class TaskContext < InstanceContext

                     class SampleList < ListResource
                    ##
                    # Initialize the SampleList
                    # @param [Version] version Version that contains the resource
                    # @return [SampleList] SampleList
                    def initialize(version, assistant_sid: nil, task_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { assistant_sid: assistant_sid, task_sid: task_sid }
                        @uri = "/Assistants/#{@solution[:assistant_sid]}/Tasks/#{@solution[:task_sid]}/Samples"
                        
                    end
                    ##
                    # Create the SampleInstance
                    # @param [String] language The [ISO language-country](https://docs.oracle.com/cd/E13214_01/wli/docs92/xref/xqisocodes.html) string that specifies the language used for the new sample. For example: `en-US`.
                    # @param [String] tagged_text The text example of how end users might express the task. The sample can contain [Field tag blocks](https://www.twilio.com/docs/autopilot/api/task-sample#field-tagging).
                    # @param [String] source_channel The communication channel from which the new sample was captured. Can be: `voice`, `sms`, `chat`, `alexa`, `google-assistant`, `slack`, or null if not included.
                    # @return [SampleInstance] Created SampleInstance
                    def create(
                        language: nil, 
                        tagged_text: nil, 
                        source_channel: :unset
                    )

                        data = Twilio::Values.of({
                            'Language' => language,
                            'TaggedText' => tagged_text,
                            'SourceChannel' => source_channel,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        SampleInstance.new(
                            @version,
                            payload,
                            assistant_sid: @solution[:assistant_sid],
                            task_sid: @solution[:task_sid],
                        )
                    end

                
                    ##
                    # Lists SampleInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] language The [ISO language-country](https://docs.oracle.com/cd/E13214_01/wli/docs92/xref/xqisocodes.html) string that specifies the language used for the sample. For example: `en-US`.
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
                    # @param [String] language The [ISO language-country](https://docs.oracle.com/cd/E13214_01/wli/docs92/xref/xqisocodes.html) string that specifies the language used for the sample. For example: `en-US`.
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
                    # When passed a block, yields SampleInstance records from the API.
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
                    # Retrieve a single page of SampleInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] language The [ISO language-country](https://docs.oracle.com/cd/E13214_01/wli/docs92/xref/xqisocodes.html) string that specifies the language used for the sample. For example: `en-US`.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of SampleInstance
                    def page(language: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            Language' => language,
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        SamplePage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of SampleInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of SampleInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    SamplePage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Autopilot.V1.SampleList>'
                    end
                end


                ##
                #PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
                class SampleContext < InstanceContext
                    ##
                    # Initialize the SampleContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] assistant_sid The SID of the [Assistant](https://www.twilio.com/docs/autopilot/api/assistant) that is the parent of the Task associated with the resource to update.
                    # @param [String] task_sid The SID of the [Task](https://www.twilio.com/docs/autopilot/api/task) associated with the Sample resource to update.
                    # @param [String] sid The Twilio-provided string that uniquely identifies the Sample resource to update.
                    # @return [SampleContext] SampleContext
                    def initialize(version, assistant_sid, task_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { assistant_sid: assistant_sid, task_sid: task_sid, sid: sid,  }
                        @uri = "/Assistants/#{@solution[:assistant_sid]}/Tasks/#{@solution[:task_sid]}/Samples/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Delete the SampleInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the SampleInstance
                    # @return [SampleInstance] Fetched SampleInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        SampleInstance.new(
                            @version,
                            payload,
                            assistant_sid: @solution[:assistant_sid],
                            task_sid: @solution[:task_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the SampleInstance
                    # @param [String] language The [ISO language-country](https://docs.oracle.com/cd/E13214_01/wli/docs92/xref/xqisocodes.html) string that specifies the language used for the sample. For example: `en-US`.
                    # @param [String] tagged_text The text example of how end users might express the task. The sample can contain [Field tag blocks](https://www.twilio.com/docs/autopilot/api/task-sample#field-tagging).
                    # @param [String] source_channel The communication channel from which the sample was captured. Can be: `voice`, `sms`, `chat`, `alexa`, `google-assistant`, `slack`, or null if not included.
                    # @return [SampleInstance] Updated SampleInstance
                    def update(
                        language: :unset, 
                        tagged_text: :unset, 
                        source_channel: :unset
                    )

                        data = Twilio::Values.of({
                            'Language' => language,
                            'TaggedText' => tagged_text,
                            'SourceChannel' => source_channel,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        SampleInstance.new(
                            @version,
                            payload,
                            assistant_sid: @solution[:assistant_sid],
                            task_sid: @solution[:task_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Autopilot.V1.SampleContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Autopilot.V1.SampleContext #{context}>"
                    end
                end

                class SamplePage < Page
                    ##
                    # Initialize the SamplePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [SamplePage] SamplePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of SampleInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [SampleInstance] SampleInstance
                    def get_instance(payload)
                        SampleInstance.new(@version, payload, assistant_sid: @solution[:assistant_sid], task_sid: @solution[:task_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Autopilot.V1.SamplePage>'
                    end
                end
                class SampleInstance < InstanceResource
                    ##
                    # Initialize the SampleInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Sample
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [SampleInstance] SampleInstance
                    def initialize(version, payload , assistant_sid: nil, task_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'task_sid' => payload['task_sid'],
                            'language' => payload['language'],
                            'assistant_sid' => payload['assistant_sid'],
                            'sid' => payload['sid'],
                            'tagged_text' => payload['tagged_text'],
                            'url' => payload['url'],
                            'source_channel' => payload['source_channel'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'assistant_sid' => assistant_sid  || @properties['assistant_sid']  ,'task_sid' => task_sid  || @properties['task_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [SampleContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = SampleContext.new(@version , @params['assistant_sid'], @params['task_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Sample resource.
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
                    # @return [String] The SID of the [Task](https://www.twilio.com/docs/autopilot/api/task) associated with the resource.
                    def task_sid
                        @properties['task_sid']
                    end
                    
                    ##
                    # @return [String] The [ISO language-country](https://docs.oracle.com/cd/E13214_01/wli/docs92/xref/xqisocodes.html) string that specifies the language used for the sample. For example: `en-US`.
                    def language
                        @properties['language']
                    end
                    
                    ##
                    # @return [String] The SID of the [Assistant](https://www.twilio.com/docs/autopilot/api/assistant) that is the parent of the Task associated with the resource.
                    def assistant_sid
                        @properties['assistant_sid']
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Sample resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The text example of how end users might express the task. The sample can contain [Field tag blocks](https://www.twilio.com/docs/autopilot/api/task-sample#field-tagging).
                    def tagged_text
                        @properties['tagged_text']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the Sample resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [String] The communication channel from which the sample was captured. Can be: `voice`, `sms`, `chat`, `alexa`, `google-assistant`, `slack`, or null if not included.
                    def source_channel
                        @properties['source_channel']
                    end
                    
                    ##
                    # Delete the SampleInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the SampleInstance
                    # @return [SampleInstance] Fetched SampleInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the SampleInstance
                    # @param [String] language The [ISO language-country](https://docs.oracle.com/cd/E13214_01/wli/docs92/xref/xqisocodes.html) string that specifies the language used for the sample. For example: `en-US`.
                    # @param [String] tagged_text The text example of how end users might express the task. The sample can contain [Field tag blocks](https://www.twilio.com/docs/autopilot/api/task-sample#field-tagging).
                    # @param [String] source_channel The communication channel from which the sample was captured. Can be: `voice`, `sms`, `chat`, `alexa`, `google-assistant`, `slack`, or null if not included.
                    # @return [SampleInstance] Updated SampleInstance
                    def update(
                        language: :unset, 
                        tagged_text: :unset, 
                        source_channel: :unset
                    )

                        context.update(
                            language: language, 
                            tagged_text: tagged_text, 
                            source_channel: source_channel, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Autopilot.V1.SampleInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Autopilot.V1.SampleInstance #{values}>"
                    end
                end

             end
             end
            end
        end
    end
end


