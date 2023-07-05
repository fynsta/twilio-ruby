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

                     class UserList < ListResource
                    ##
                    # Initialize the UserList
                    # @param [Version] version Version that contains the resource
                    # @return [UserList] UserList
                    def initialize(version, service_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid }
                        @uri = "/Services/#{@solution[:service_sid]}/Users"
                        
                    end
                    ##
                    # Create the UserInstance
                    # @param [String] identity The `identity` value that uniquely identifies the new resource's [User](https://www.twilio.com/docs/api/chat/rest/v1/user) within the [Service](https://www.twilio.com/docs/api/chat/rest/v1/service). This value is often a username or email address. See the Identity documentation for more details.
                    # @param [String] role_sid The SID of the [Role](https://www.twilio.com/docs/api/chat/rest/roles) assigned to the new User.
                    # @param [String] attributes A valid JSON string that contains application-specific data.
                    # @param [String] friendly_name A descriptive string that you create to describe the new resource. This value is often used for display purposes.
                    # @return [UserInstance] Created UserInstance
                    def create(
                        identity: nil, 
                        role_sid: :unset, 
                        attributes: :unset, 
                        friendly_name: :unset
                    )

                        data = Twilio::Values.of({
                            'Identity' => identity,
                            'RoleSid' => role_sid,
                            'Attributes' => attributes,
                            'FriendlyName' => friendly_name,
                        })

                        payload = @version.create('POST', @uri, data: data)
                        UserInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                        )
                    end

                
                    ##
                    # Lists UserInstance records from the API as a list.
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
                    # When passed a block, yields UserInstance records from the API.
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
                    # Retrieve a single page of UserInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of UserInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        UserPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of UserInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of UserInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    UserPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Chat.V1.UserList>'
                    end
                end


                class UserContext < InstanceContext
                    ##
                    # Initialize the UserContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] service_sid The SID of the [Service](https://www.twilio.com/docs/api/chat/rest/services) to update the resource from.
                    # @param [String] sid The Twilio-provided string that uniquely identifies the User resource to update.
                    # @return [UserContext] UserContext
                    def initialize(version, service_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { service_sid: service_sid, sid: sid,  }
                        @uri = "/Services/#{@solution[:service_sid]}/Users/#{@solution[:sid]}"

                        # Dependents
                        @user_channels = nil
                    end
                    ##
                    # Delete the UserInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        @version.delete('DELETE', @uri)
                    end

                    ##
                    # Fetch the UserInstance
                    # @return [UserInstance] Fetched UserInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        UserInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the UserInstance
                    # @param [String] role_sid The SID of the [Role](https://www.twilio.com/docs/api/chat/rest/roles) assigned to this user.
                    # @param [String] attributes A valid JSON string that contains application-specific data.
                    # @param [String] friendly_name A descriptive string that you create to describe the resource. It is often used for display purposes.
                    # @return [UserInstance] Updated UserInstance
                    def update(
                        role_sid: :unset, 
                        attributes: :unset, 
                        friendly_name: :unset
                    )

                        data = Twilio::Values.of({
                            'RoleSid' => role_sid,
                            'Attributes' => attributes,
                            'FriendlyName' => friendly_name,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        UserInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the user_channels
                    # @return [UserChannelList]
                    # @return [UserChannelContext]
                    def user_channels
                      unless @user_channels
                        @user_channels = UserChannelList.new(
                                @version, service_sid: @solution[:service_sid],  user_sid: @solution[:sid], )
                      end
                      @user_channels
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Chat.V1.UserContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Chat.V1.UserContext #{context}>"
                    end
                end

                class UserPage < Page
                    ##
                    # Initialize the UserPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [UserPage] UserPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of UserInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [UserInstance] UserInstance
                    def get_instance(payload)
                        UserInstance.new(@version, payload, service_sid: @solution[:service_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Chat.V1.UserPage>'
                    end
                end
                class UserInstance < InstanceResource
                    ##
                    # Initialize the UserInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this User
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [UserInstance] UserInstance
                    def initialize(version, payload , service_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'service_sid' => payload['service_sid'],
                            'attributes' => payload['attributes'],
                            'friendly_name' => payload['friendly_name'],
                            'role_sid' => payload['role_sid'],
                            'identity' => payload['identity'],
                            'is_online' => payload['is_online'],
                            'is_notifiable' => payload['is_notifiable'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'joined_channels_count' => payload['joined_channels_count'] == nil ? payload['joined_channels_count'] : payload['joined_channels_count'].to_i,
                            'links' => payload['links'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'service_sid' => service_sid  || @properties['service_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [UserContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = UserContext.new(@version , @params['service_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the User resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/api/rest/account) that created the User resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Service](https://www.twilio.com/docs/api/chat/rest/services) the resource is associated with.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [String] The JSON string that stores application-specific data. **Note** If this property has been assigned a value, it's only  displayed in a FETCH action that returns a single resource; otherwise, it's null. If the attributes have not been set, `{}` is returned.
                    def attributes
                        @properties['attributes']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the resource.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] The SID of the [Role](https://www.twilio.com/docs/api/chat/rest/roles) assigned to the user.
                    def role_sid
                        @properties['role_sid']
                    end
                    
                    ##
                    # @return [String] The application-defined string that uniquely identifies the resource's User within the [Service](https://www.twilio.com/docs/api/chat/rest/services). This value is often a username or an email address. See [access tokens](https://www.twilio.com/docs/api/chat/guides/create-tokens) for more info.
                    def identity
                        @properties['identity']
                    end
                    
                    ##
                    # @return [Boolean] Whether the User is actively connected to the Service instance and online. This value is only returned by Fetch actions that return a single resource and `null` is always returned by a Read action. This value is `null` if the Service's `reachability_enabled` is `false`, if the User has never been online for the Service instance, even if the Service's `reachability_enabled` is `true`.
                    def is_online
                        @properties['is_online']
                    end
                    
                    ##
                    # @return [Boolean] Whether the User has a potentially valid Push Notification registration (APN or GCM) for the Service instance. If at least one registration exists, `true`; otherwise `false`. This value is only returned by Fetch actions that return a single resource and `null` is always returned by a Read action. This value is `null` if the Service's `reachability_enabled` is `false`, and if the User has never had a notification registration, even if the Service's `reachability_enabled` is `true`.
                    def is_notifiable
                        @properties['is_notifiable']
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
                    # @return [String] The number of Channels this User is a Member of.
                    def joined_channels_count
                        @properties['joined_channels_count']
                    end
                    
                    ##
                    # @return [Hash] The absolute URLs of the [Channel](https://www.twilio.com/docs/chat/api/channels) and [Binding](https://www.twilio.com/docs/chat/rest/bindings-resource) resources related to the user.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the User resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Delete the UserInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the UserInstance
                    # @return [UserInstance] Fetched UserInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the UserInstance
                    # @param [String] role_sid The SID of the [Role](https://www.twilio.com/docs/api/chat/rest/roles) assigned to this user.
                    # @param [String] attributes A valid JSON string that contains application-specific data.
                    # @param [String] friendly_name A descriptive string that you create to describe the resource. It is often used for display purposes.
                    # @return [UserInstance] Updated UserInstance
                    def update(
                        role_sid: :unset, 
                        attributes: :unset, 
                        friendly_name: :unset
                    )

                        context.update(
                            role_sid: role_sid, 
                            attributes: attributes, 
                            friendly_name: friendly_name, 
                        )
                    end

                    ##
                    # Access the user_channels
                    # @return [user_channels] user_channels
                    def user_channels
                        context.user_channels
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Chat.V1.UserInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Chat.V1.UserInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


