##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Chat
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Chat < ChatBase
            class V1 < Version
                class ServiceContext < InstanceContext
                class ChannelContext < InstanceContext

                     class MessageList < ListResource
                
                    ##
                    # Initialize the MessageList
                    # @param [Version] version Version that contains the resource
                    # @return [MessageList] MessageList
                    def initialize(version, service_sid: nil, channel_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid, channel_sid: channel_sid }
                        @uri = "/Services/#{@solution[:service_sid]}/Channels/#{@solution[:channel_sid]}/Messages"
                        
                    end
                    ##
                    # Create the MessageInstance
                    # @param [String] body The message to send to the channel. Can also be an empty string or `null`, which sets the value as an empty string. You can send structured data in the body by serializing it as a string.
                    # @param [String] from The [identity](https://www.twilio.com/docs/api/chat/guides/identity) of the new message's author. The default value is `system`.
                    # @param [String] attributes A valid JSON string that contains application-specific data.
                    # @return [MessageInstance] Created MessageInstance
                    def create(
                        body: nil, 
                        from: :unset, 
                        attributes: :unset
                    )

                        data = Twilio::Values.of({
                            'Body' => body,
                            'From' => from,
                            'Attributes' => attributes,
                        })

                        
                        payload = @version.create('POST', @uri, data: data)
                        MessageInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            channel_sid: @solution[:channel_sid],
                        )
                    end

                
                    ##
                    # Lists MessageInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [OrderType] order The sort order of the returned messages. Can be: `asc` (ascending) or `desc` (descending) with `asc` as the default.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(order: :unset, limit: nil, page_size: nil)
                        self.stream(
                            order: order,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [OrderType] order The sort order of the returned messages. Can be: `asc` (ascending) or `desc` (descending) with `asc` as the default.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(order: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            order: order,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields MessageInstance records from the API.
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
                    # Retrieve a single page of MessageInstance records from the API.
                    # Request is executed immediately.
                    # @param [OrderType] order The sort order of the returned messages. Can be: `asc` (ascending) or `desc` (descending) with `asc` as the default.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of MessageInstance
                    def page(order: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'Order' => order,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        MessagePage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of MessageInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of MessageInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    MessagePage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Chat.V1.MessageList>'
                    end
                end


                class MessageContext < InstanceContext
                    ##
                    # Initialize the MessageContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] service_sid The SID of the [Service](https://www.twilio.com/docs/api/chat/rest/services) to update the resource from.
                    # @param [String] channel_sid The unique ID of the [Channel](https://www.twilio.com/docs/api/chat/rest/channels) the message belongs to. Can be the Channel's `sid` or `unique_name`.
                    # @param [String] sid The Twilio-provided string that uniquely identifies the Message resource to update.
                    # @return [MessageContext] MessageContext
                    def initialize(version, service_sid, channel_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { service_sid: service_sid, channel_sid: channel_sid, sid: sid,  }
                        @uri = "/Services/#{@solution[:service_sid]}/Channels/#{@solution[:channel_sid]}/Messages/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Delete the MessageInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        
                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the MessageInstance
                    # @return [MessageInstance] Fetched MessageInstance
                    def fetch

                        
                        payload = @version.fetch('GET', @uri)
                        MessageInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            channel_sid: @solution[:channel_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the MessageInstance
                    # @param [String] body The message to send to the channel. Can also be an empty string or `null`, which sets the value as an empty string. You can send structured data in the body by serializing it as a string.
                    # @param [String] attributes A valid JSON string that contains application-specific data.
                    # @return [MessageInstance] Updated MessageInstance
                    def update(
                        body: :unset, 
                        attributes: :unset
                    )

                        data = Twilio::Values.of({
                            'Body' => body,
                            'Attributes' => attributes,
                        })

                        
                        payload = @version.update('POST', @uri, data: data)
                        MessageInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            channel_sid: @solution[:channel_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Chat.V1.MessageContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Chat.V1.MessageContext #{context}>"
                    end
                end

                class MessagePage < Page
                    ##
                    # Initialize the MessagePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [MessagePage] MessagePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of MessageInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [MessageInstance] MessageInstance
                    def get_instance(payload)
                        MessageInstance.new(@version, payload, service_sid: @solution[:service_sid], channel_sid: @solution[:channel_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Chat.V1.MessagePage>'
                    end
                end
                class MessageInstance < InstanceResource
                    ##
                    # Initialize the MessageInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Message
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [MessageInstance] MessageInstance
                    def initialize(version, payload , service_sid: nil, channel_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'attributes' => payload['attributes'],
                            'service_sid' => payload['service_sid'],
                            'to' => payload['to'],
                            'channel_sid' => payload['channel_sid'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'was_edited' => payload['was_edited'],
                            'from' => payload['from'],
                            'body' => payload['body'],
                            'index' => payload['index'] == nil ? payload['index'] : payload['index'].to_i,
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'service_sid' => service_sid  || @properties['service_sid']  ,'channel_sid' => channel_sid  || @properties['channel_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [MessageContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = MessageContext.new(@version , @params['service_sid'], @params['channel_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Message resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/api/rest/account) that created the Message resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The JSON string that stores application-specific data. **Note** If this property has been assigned a value, it's only  displayed in a FETCH action that returns a single resource; otherwise, it's null. If the attributes have not been set, `{}` is returned.
                    def attributes
                        @properties['attributes']
                    end
                    
                    ##
                    # @return [String] The SID of the [Service](https://www.twilio.com/docs/api/chat/rest/services) the resource is associated with.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Channel](https://www.twilio.com/docs/chat/api/channels) that the message was sent to.
                    def to
                        @properties['to']
                    end
                    
                    ##
                    # @return [String] The unique ID of the [Channel](https://www.twilio.com/docs/api/chat/rest/channels) the Message resource belongs to.
                    def channel_sid
                        @properties['channel_sid']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [Boolean] Whether the message has been edited since it was created.
                    def was_edited
                        @properties['was_edited']
                    end
                    
                    ##
                    # @return [String] The [identity](https://www.twilio.com/docs/api/chat/guides/identity) of the message's author. The default value is `system`.
                    def from
                        @properties['from']
                    end
                    
                    ##
                    # @return [String] The content of the message.
                    def body
                        @properties['body']
                    end
                    
                    ##
                    # @return [String] The index of the message within the [Channel](https://www.twilio.com/docs/chat/api/channels).
                    def index
                        @properties['index']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the Message resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Delete the MessageInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the MessageInstance
                    # @return [MessageInstance] Fetched MessageInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the MessageInstance
                    # @param [String] body The message to send to the channel. Can also be an empty string or `null`, which sets the value as an empty string. You can send structured data in the body by serializing it as a string.
                    # @param [String] attributes A valid JSON string that contains application-specific data.
                    # @return [MessageInstance] Updated MessageInstance
                    def update(
                        body: :unset, 
                        attributes: :unset
                    )

                        context.update(
                            body: body, 
                            attributes: attributes, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Chat.V1.MessageInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Chat.V1.MessageInstance #{values}>"
                    end
                end

             end
             end
            end
        end
    end
end


