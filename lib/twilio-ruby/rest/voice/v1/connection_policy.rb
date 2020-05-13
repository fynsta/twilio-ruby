##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Voice < Domain
      class V1 < Version
        class ConnectionPolicyList < ListResource
          ##
          # Initialize the ConnectionPolicyList
          # @param [Version] version Version that contains the resource
          # @return [ConnectionPolicyList] ConnectionPolicyList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/ConnectionPolicies"
          end

          ##
          # Retrieve a single page of ConnectionPolicyInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the resource. It is not unique and can be up to 255 characters long.
          # @return [ConnectionPolicyInstance] Newly created ConnectionPolicyInstance
          def create(friendly_name: :unset)
            data = Twilio::Values.of({'FriendlyName' => friendly_name, })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            ConnectionPolicyInstance.new(@version, payload, )
          end

          ##
          # Lists ConnectionPolicyInstance records from the API as a list.
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
            self.stream(limit: limit, page_size: page_size).entries
          end

          ##
          # Streams ConnectionPolicyInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(page_size: limits[:page_size], )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields ConnectionPolicyInstance records from the API.
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
          # Retrieve a single page of ConnectionPolicyInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of ConnectionPolicyInstance
          def page(page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            ConnectionPolicyPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of ConnectionPolicyInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of ConnectionPolicyInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            ConnectionPolicyPage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Voice.V1.ConnectionPolicyList>'
          end
        end

        class ConnectionPolicyPage < Page
          ##
          # Initialize the ConnectionPolicyPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [ConnectionPolicyPage] ConnectionPolicyPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of ConnectionPolicyInstance
          # @param [Hash] payload Payload response from the API
          # @return [ConnectionPolicyInstance] ConnectionPolicyInstance
          def get_instance(payload)
            ConnectionPolicyInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Voice.V1.ConnectionPolicyPage>'
          end
        end

        class ConnectionPolicyContext < InstanceContext
          ##
          # Initialize the ConnectionPolicyContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The unique string that we created to identify the Connection
          #   Policy resource to fetch.
          # @return [ConnectionPolicyContext] ConnectionPolicyContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/ConnectionPolicies/#{@solution[:sid]}"

            # Dependents
            @targets = nil
          end

          ##
          # Fetch a ConnectionPolicyInstance
          # @return [ConnectionPolicyInstance] Fetched ConnectionPolicyInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            ConnectionPolicyInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Update the ConnectionPolicyInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the resource. It is not unique and can be up to 255 characters long.
          # @return [ConnectionPolicyInstance] Updated ConnectionPolicyInstance
          def update(friendly_name: :unset)
            data = Twilio::Values.of({'FriendlyName' => friendly_name, })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            ConnectionPolicyInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Deletes the ConnectionPolicyInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Access the targets
          # @return [ConnectionPolicyTargetList]
          # @return [ConnectionPolicyTargetContext] if sid was passed.
          def targets(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return ConnectionPolicyTargetContext.new(@version, @solution[:sid], sid, )
            end

            unless @targets
              @targets = ConnectionPolicyTargetList.new(@version, connection_policy_sid: @solution[:sid], )
            end

            @targets
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Voice.V1.ConnectionPolicyContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Voice.V1.ConnectionPolicyContext #{context}>"
          end
        end

        class ConnectionPolicyInstance < InstanceResource
          ##
          # Initialize the ConnectionPolicyInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The unique string that we created to identify the Connection
          #   Policy resource to fetch.
          # @return [ConnectionPolicyInstance] ConnectionPolicyInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'sid' => payload['sid'],
                'friendly_name' => payload['friendly_name'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'url' => payload['url'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [ConnectionPolicyContext] ConnectionPolicyContext for this ConnectionPolicyInstance
          def context
            unless @instance_context
              @instance_context = ConnectionPolicyContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] The SID of the Account that created the resource
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] The unique string that identifies the resource
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The string that you assigned to describe the resource
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [Time] The RFC 2822 date and time in GMT when the resource was created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The RFC 2822 date and time in GMT when the resource was last updated
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] The absolute URL of the resource
          def url
            @properties['url']
          end

          ##
          # @return [String] The URLs of related resources
          def links
            @properties['links']
          end

          ##
          # Fetch a ConnectionPolicyInstance
          # @return [ConnectionPolicyInstance] Fetched ConnectionPolicyInstance
          def fetch
            context.fetch
          end

          ##
          # Update the ConnectionPolicyInstance
          # @param [String] friendly_name A descriptive string that you create to describe
          #   the resource. It is not unique and can be up to 255 characters long.
          # @return [ConnectionPolicyInstance] Updated ConnectionPolicyInstance
          def update(friendly_name: :unset)
            context.update(friendly_name: friendly_name, )
          end

          ##
          # Deletes the ConnectionPolicyInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
            context.delete
          end

          ##
          # Access the targets
          # @return [targets] targets
          def targets
            context.targets
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Voice.V1.ConnectionPolicyInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Voice.V1.ConnectionPolicyInstance #{values}>"
          end
        end
      end
    end
  end
end