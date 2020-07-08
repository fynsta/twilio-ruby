##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceContext < InstanceContext
          class EventList < ListResource
            ##
            # Initialize the EventList
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The SID of the Workspace that contains the Event.
            # @return [EventList] EventList
            def initialize(version, workspace_sid: nil)
              super(version)

              # Path Solution
              @solution = {workspace_sid: workspace_sid}
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/Events"
            end

            ##
            # Lists EventInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Time] end_date Only include Events that occurred on or before this date,
            #   specified in GMT as an [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
            #   date-time.
            # @param [String] event_type The type of Events to read. Returns only Events of
            #   the type specified.
            # @param [String] minutes The period of events to read in minutes. Returns only
            #   Events that occurred since this many minutes in the past. The default is `15`
            #   minutes. Task Attributes for Events occuring more 43,200 minutes ago will be
            #   redacted.
            # @param [String] reservation_sid The SID of the Reservation with the Events to
            #   read. Returns only Events that pertain to the specified Reservation.
            # @param [Time] start_date Only include Events from on or after this date and
            #   time, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
            #   Task Attributes for Events older than 30 days will be redacted.
            # @param [String] task_queue_sid The SID of the TaskQueue with the Events to read.
            #   Returns only the Events that pertain to the specified TaskQueue.
            # @param [String] task_sid The SID of the Task with the Events to read. Returns
            #   only the Events that pertain to the specified Task.
            # @param [String] worker_sid The SID of the Worker with the Events to read.
            #   Returns only the Events that pertain to the specified Worker.
            # @param [String] workflow_sid The SID of the Workflow with the Events to read.
            #   Returns only the Events that pertain to the specified Workflow.
            # @param [String] task_channel The TaskChannel with the Events to read. Returns
            #   only the Events that pertain to the specified TaskChannel.
            # @param [String] sid The SID of the Event resource to read.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(end_date: :unset, event_type: :unset, minutes: :unset, reservation_sid: :unset, start_date: :unset, task_queue_sid: :unset, task_sid: :unset, worker_sid: :unset, workflow_sid: :unset, task_channel: :unset, sid: :unset, limit: nil, page_size: nil)
              self.stream(
                  end_date: end_date,
                  event_type: event_type,
                  minutes: minutes,
                  reservation_sid: reservation_sid,
                  start_date: start_date,
                  task_queue_sid: task_queue_sid,
                  task_sid: task_sid,
                  worker_sid: worker_sid,
                  workflow_sid: workflow_sid,
                  task_channel: task_channel,
                  sid: sid,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams EventInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Time] end_date Only include Events that occurred on or before this date,
            #   specified in GMT as an [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
            #   date-time.
            # @param [String] event_type The type of Events to read. Returns only Events of
            #   the type specified.
            # @param [String] minutes The period of events to read in minutes. Returns only
            #   Events that occurred since this many minutes in the past. The default is `15`
            #   minutes. Task Attributes for Events occuring more 43,200 minutes ago will be
            #   redacted.
            # @param [String] reservation_sid The SID of the Reservation with the Events to
            #   read. Returns only Events that pertain to the specified Reservation.
            # @param [Time] start_date Only include Events from on or after this date and
            #   time, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
            #   Task Attributes for Events older than 30 days will be redacted.
            # @param [String] task_queue_sid The SID of the TaskQueue with the Events to read.
            #   Returns only the Events that pertain to the specified TaskQueue.
            # @param [String] task_sid The SID of the Task with the Events to read. Returns
            #   only the Events that pertain to the specified Task.
            # @param [String] worker_sid The SID of the Worker with the Events to read.
            #   Returns only the Events that pertain to the specified Worker.
            # @param [String] workflow_sid The SID of the Workflow with the Events to read.
            #   Returns only the Events that pertain to the specified Workflow.
            # @param [String] task_channel The TaskChannel with the Events to read. Returns
            #   only the Events that pertain to the specified TaskChannel.
            # @param [String] sid The SID of the Event resource to read.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(end_date: :unset, event_type: :unset, minutes: :unset, reservation_sid: :unset, start_date: :unset, task_queue_sid: :unset, task_sid: :unset, worker_sid: :unset, workflow_sid: :unset, task_channel: :unset, sid: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  end_date: end_date,
                  event_type: event_type,
                  minutes: minutes,
                  reservation_sid: reservation_sid,
                  start_date: start_date,
                  task_queue_sid: task_queue_sid,
                  task_sid: task_sid,
                  worker_sid: worker_sid,
                  workflow_sid: workflow_sid,
                  task_channel: task_channel,
                  sid: sid,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields EventInstance records from the API.
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
            # Retrieve a single page of EventInstance records from the API.
            # Request is executed immediately.
            # @param [Time] end_date Only include Events that occurred on or before this date,
            #   specified in GMT as an [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
            #   date-time.
            # @param [String] event_type The type of Events to read. Returns only Events of
            #   the type specified.
            # @param [String] minutes The period of events to read in minutes. Returns only
            #   Events that occurred since this many minutes in the past. The default is `15`
            #   minutes. Task Attributes for Events occuring more 43,200 minutes ago will be
            #   redacted.
            # @param [String] reservation_sid The SID of the Reservation with the Events to
            #   read. Returns only Events that pertain to the specified Reservation.
            # @param [Time] start_date Only include Events from on or after this date and
            #   time, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
            #   Task Attributes for Events older than 30 days will be redacted.
            # @param [String] task_queue_sid The SID of the TaskQueue with the Events to read.
            #   Returns only the Events that pertain to the specified TaskQueue.
            # @param [String] task_sid The SID of the Task with the Events to read. Returns
            #   only the Events that pertain to the specified Task.
            # @param [String] worker_sid The SID of the Worker with the Events to read.
            #   Returns only the Events that pertain to the specified Worker.
            # @param [String] workflow_sid The SID of the Workflow with the Events to read.
            #   Returns only the Events that pertain to the specified Workflow.
            # @param [String] task_channel The TaskChannel with the Events to read. Returns
            #   only the Events that pertain to the specified TaskChannel.
            # @param [String] sid The SID of the Event resource to read.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of EventInstance
            def page(end_date: :unset, event_type: :unset, minutes: :unset, reservation_sid: :unset, start_date: :unset, task_queue_sid: :unset, task_sid: :unset, worker_sid: :unset, workflow_sid: :unset, task_channel: :unset, sid: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'EndDate' => Twilio.serialize_iso8601_datetime(end_date),
                  'EventType' => event_type,
                  'Minutes' => minutes,
                  'ReservationSid' => reservation_sid,
                  'StartDate' => Twilio.serialize_iso8601_datetime(start_date),
                  'TaskQueueSid' => task_queue_sid,
                  'TaskSid' => task_sid,
                  'WorkerSid' => worker_sid,
                  'WorkflowSid' => workflow_sid,
                  'TaskChannel' => task_channel,
                  'Sid' => sid,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params)

              EventPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of EventInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of EventInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              EventPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Taskrouter.V1.EventList>'
            end
          end

          class EventPage < Page
            ##
            # Initialize the EventPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [EventPage] EventPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of EventInstance
            # @param [Hash] payload Payload response from the API
            # @return [EventInstance] EventInstance
            def get_instance(payload)
              EventInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Taskrouter.V1.EventPage>'
            end
          end

          class EventContext < InstanceContext
            ##
            # Initialize the EventContext
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The SID of the Workspace with the Event to fetch.
            # @param [String] sid The SID of the Event resource to fetch.
            # @return [EventContext] EventContext
            def initialize(version, workspace_sid, sid)
              super(version)

              # Path Solution
              @solution = {workspace_sid: workspace_sid, sid: sid, }
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/Events/#{@solution[:sid]}"
            end

            ##
            # Fetch the EventInstance
            # @return [EventInstance] Fetched EventInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              EventInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], sid: @solution[:sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Taskrouter.V1.EventContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Taskrouter.V1.EventContext #{context}>"
            end
          end

          class EventInstance < InstanceResource
            ##
            # Initialize the EventInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] workspace_sid The SID of the Workspace that contains the Event.
            # @param [String] sid The SID of the Event resource to fetch.
            # @return [EventInstance] EventInstance
            def initialize(version, payload, workspace_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'actor_sid' => payload['actor_sid'],
                  'actor_type' => payload['actor_type'],
                  'actor_url' => payload['actor_url'],
                  'description' => payload['description'],
                  'event_data' => payload['event_data'],
                  'event_date' => Twilio.deserialize_iso8601_datetime(payload['event_date']),
                  'event_date_ms' => payload['event_date_ms'].to_i,
                  'event_type' => payload['event_type'],
                  'resource_sid' => payload['resource_sid'],
                  'resource_type' => payload['resource_type'],
                  'resource_url' => payload['resource_url'],
                  'sid' => payload['sid'],
                  'source' => payload['source'],
                  'source_ip_address' => payload['source_ip_address'],
                  'url' => payload['url'],
                  'workspace_sid' => payload['workspace_sid'],
              }

              # Context
              @instance_context = nil
              @params = {'workspace_sid' => workspace_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [EventContext] EventContext for this EventInstance
            def context
              unless @instance_context
                @instance_context = EventContext.new(@version, @params['workspace_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The SID of the Account that created the resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The SID of the resource that triggered the event
            def actor_sid
              @properties['actor_sid']
            end

            ##
            # @return [String] The type of resource that triggered the event
            def actor_type
              @properties['actor_type']
            end

            ##
            # @return [String] The absolute URL of the resource that triggered the event
            def actor_url
              @properties['actor_url']
            end

            ##
            # @return [String] A description of the event
            def description
              @properties['description']
            end

            ##
            # @return [Hash] Data about the event
            def event_data
              @properties['event_data']
            end

            ##
            # @return [Time] The time the event was sent
            def event_date
              @properties['event_date']
            end

            ##
            # @return [String] The time the event was sent in milliseconds
            def event_date_ms
              @properties['event_date_ms']
            end

            ##
            # @return [String] The identifier for the event
            def event_type
              @properties['event_type']
            end

            ##
            # @return [String] The SID of the object the event is most relevant to
            def resource_sid
              @properties['resource_sid']
            end

            ##
            # @return [String] The type of object the event is most relevant to
            def resource_type
              @properties['resource_type']
            end

            ##
            # @return [String] The URL of the resource the event is most relevant to
            def resource_url
              @properties['resource_url']
            end

            ##
            # @return [String] The unique string that identifies the resource
            def sid
              @properties['sid']
            end

            ##
            # @return [String] Where the Event originated
            def source
              @properties['source']
            end

            ##
            # @return [String] The IP from which the Event originated
            def source_ip_address
              @properties['source_ip_address']
            end

            ##
            # @return [String] The absolute URL of the Event resource
            def url
              @properties['url']
            end

            ##
            # @return [String] The SID of the Workspace that contains the Event
            def workspace_sid
              @properties['workspace_sid']
            end

            ##
            # Fetch the EventInstance
            # @return [EventInstance] Fetched EventInstance
            def fetch
              context.fetch
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.EventInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.EventInstance #{values}>"
            end
          end
        end
      end
    end
  end
end