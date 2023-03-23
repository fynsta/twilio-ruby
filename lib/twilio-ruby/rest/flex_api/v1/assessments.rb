##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Flex
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class FlexApi < FlexApiBase
            class V1 < Version
                class AssessmentsList < ListResource
                    ##
                    # Initialize the AssessmentsList
                    # @param [Version] version Version that contains the resource
                    # @return [AssessmentsList] AssessmentsList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Insights/QM/Assessments"
                        
                    end
                    ##
                    # Create the AssessmentsInstance
                    # @param [String] category_id The id of the category 
                    # @param [String] category_name The name of the category
                    # @param [String] segment_id Segment Id of the conversation
                    # @param [String] user_name Name of the user assessing conversation
                    # @param [String] user_email Email of the user assessing conversation
                    # @param [String] agent_id The id of the Agent
                    # @param [Float] offset The offset of the conversation.
                    # @param [String] metric_id The question Id selected for assessment
                    # @param [String] metric_name The question name of the assessment
                    # @param [String] answer_text The answer text selected by user
                    # @param [String] answer_id The id of the answer selected by user
                    # @param [String] questionnaire_id Questionnaire Id of the associated question
                    # @param [String] token The Token HTTP request header
                    # @return [AssessmentsInstance] Created AssessmentsInstance
                    def create(
                        category_id: nil, 
                        category_name: nil, 
                        segment_id: nil, 
                        user_name: nil, 
                        user_email: nil, 
                        agent_id: nil, 
                        offset: nil, 
                        metric_id: nil, 
                        metric_name: nil, 
                        answer_text: nil, 
                        answer_id: nil, 
                        questionnaire_id: nil, 
                        token: :unset
                    )

                        data = Twilio::Values.of({
                            'CategoryId' => category_id,
                            'CategoryName' => category_name,
                            'SegmentId' => segment_id,
                            'UserName' => user_name,
                            'UserEmail' => user_email,
                            'AgentId' => agent_id,
                            'Offset' => offset,
                            'MetricId' => metric_id,
                            'MetricName' => metric_name,
                            'AnswerText' => answer_text,
                            'AnswerId' => answer_id,
                            'QuestionnaireId' => questionnaire_id,
                        })

                        headers = Twilio::Values.of({ 'Token' => token, })
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        AssessmentsInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists AssessmentsInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] token The Token HTTP request header
                    # @param [String] segment_id The id of the segment.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(token: :unset, segment_id: :unset, limit: nil, page_size: nil)
                        self.stream(
                            token: token,
                            segment_id: segment_id,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] token The Token HTTP request header
                    # @param [String] segment_id The id of the segment.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(token: :unset, segment_id: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            token: token,
                            segment_id: segment_id,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields AssessmentsInstance records from the API.
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
                    # Retrieve a single page of AssessmentsInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] token The Token HTTP request header
                    # @param [String] segment_id The id of the segment.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of AssessmentsInstance
                    def page(token: :unset, segment_id: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'Token' => token,
                            
                            'SegmentId' => segment_id,
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        AssessmentsPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of AssessmentsInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of AssessmentsInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    AssessmentsPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.FlexApi.V1.AssessmentsList>'
                    end
                end

                ##
                #PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
                class AssessmentsContext < InstanceContext
                    ##
                    # Initialize the AssessmentsContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] assessment_id The id of the assessment to be modified
                    # @return [AssessmentsContext] AssessmentsContext
                    def initialize(version, assessment_id)
                        super(version)

                        # Path Solution
                        @solution = { assessment_id: assessment_id,  }
                        @uri = "/Insights/QM/Assessments/#{@solution[:assessment_id]}"

                        
                    end
                    ##
                    # Update the AssessmentsInstance
                    # @param [Float] offset The offset of the conversation
                    # @param [String] answer_text The answer text selected by user
                    # @param [String] answer_id The id of the answer selected by user
                    # @param [String] token The Token HTTP request header
                    # @return [AssessmentsInstance] Updated AssessmentsInstance
                    def update(
                        offset: nil, 
                        answer_text: nil, 
                        answer_id: nil, 
                        token: :unset
                    )

                        data = Twilio::Values.of({
                            'Offset' => offset,
                            'AnswerText' => answer_text,
                            'AnswerId' => answer_id,
                        })

                        headers = Twilio::Values.of({ 'Token' => token, })
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        AssessmentsInstance.new(
                            @version,
                            payload,
                            assessment_id: @solution[:assessment_id],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.AssessmentsContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.AssessmentsContext #{context}>"
                    end
                end

                class AssessmentsPage < Page
                    ##
                    # Initialize the AssessmentsPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [AssessmentsPage] AssessmentsPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of AssessmentsInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [AssessmentsInstance] AssessmentsInstance
                    def get_instance(payload)
                        AssessmentsInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.FlexApi.V1.AssessmentsPage>'
                    end
                end
                class AssessmentsInstance < InstanceResource
                    ##
                    # Initialize the AssessmentsInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Assessments
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [AssessmentsInstance] AssessmentsInstance
                    def initialize(version, payload , assessment_id: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'assessment_id' => payload['assessment_id'],
                            'offset' => payload['offset'],
                            'report' => payload['report'],
                            'weight' => payload['weight'],
                            'agent_id' => payload['agent_id'],
                            'segment_id' => payload['segment_id'],
                            'user_name' => payload['user_name'],
                            'user_email' => payload['user_email'],
                            'answer_text' => payload['answer_text'],
                            'answer_id' => payload['answer_id'],
                            'assessment' => payload['assessment'],
                            'timestamp' => payload['timestamp'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'assessment_id' => assessment_id  || @properties['assessment_id']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [AssessmentsContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = AssessmentsContext.new(@version , @params['assessment_id'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique SID identifier of the Account.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The unique id of the assessment
                    def assessment_id
                        @properties['assessment_id']
                    end
                    
                    ##
                    # @return [Float] Offset of the conversation
                    def offset
                        @properties['offset']
                    end
                    
                    ##
                    # @return [Boolean] The flag indicating if this assessment is part of report 
                    def report
                        @properties['report']
                    end
                    
                    ##
                    # @return [Float] The weightage given to this comment
                    def weight
                        @properties['weight']
                    end
                    
                    ##
                    # @return [String] The id of the Agent
                    def agent_id
                        @properties['agent_id']
                    end
                    
                    ##
                    # @return [String] Segment Id of conversation
                    def segment_id
                        @properties['segment_id']
                    end
                    
                    ##
                    # @return [String] The name of the user.
                    def user_name
                        @properties['user_name']
                    end
                    
                    ##
                    # @return [String] The email id of the user.
                    def user_email
                        @properties['user_email']
                    end
                    
                    ##
                    # @return [String] The answer text selected by user
                    def answer_text
                        @properties['answer_text']
                    end
                    
                    ##
                    # @return [String] The id of the answer selected by user
                    def answer_id
                        @properties['answer_id']
                    end
                    
                    ##
                    # @return [Hash] Assessment Details associated with an assessment
                    def assessment
                        @properties['assessment']
                    end
                    
                    ##
                    # @return [Float] 
                    def timestamp
                        @properties['timestamp']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Update the AssessmentsInstance
                    # @param [Float] offset The offset of the conversation
                    # @param [String] answer_text The answer text selected by user
                    # @param [String] answer_id The id of the answer selected by user
                    # @param [String] token The Token HTTP request header
                    # @return [AssessmentsInstance] Updated AssessmentsInstance
                    def update(
                        offset: nil, 
                        answer_text: nil, 
                        answer_id: nil, 
                        token: :unset
                    )

                        context.update(
                            offset: offset, 
                            answer_text: answer_text, 
                            answer_id: answer_id, 
                            token: token, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.AssessmentsInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.AssessmentsInstance #{values}>"
                    end
                end
            end
        end
    end
end