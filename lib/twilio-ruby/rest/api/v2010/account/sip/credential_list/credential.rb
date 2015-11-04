##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class CredentialList < ListResource
      ##
      # Initialize the CredentialList
      def initialize(version, account_sid, credential_list_sid)
        super
        
        # Path Solution
        @solution = {
            account_sid: account_sid,
            credential_list_sid: credential_list_sid
        }
        @uri = "/Accounts/#{@solution[:account_sid]}/SIP/CredentialLists/#{@solution[:credential_list_sid]}/Credentials.json"
      end
      
      ##
      # Reads CredentialInstance records from the API as a list.
      def read(self, limit=nil, page_size=nil)
        @version.read(
            limit,
            page_size
        ))
      end
      
      ##
      # Retrieve a single page of CredentialInstance records from the API.
      def page(self, page_token=None, page_number=None, page_size=None)
        params = values.of({
            PageToken: page_token,
            Page: page_number,
            PageSize: page_size,
        })
        @version.page(
            self,
            CredentialInstance,
            @solution,
            'GET',
            @uri,
            params
        )
      end
      
      ##
      # Create a new CredentialInstance
      def create(self, username, password)
        data = values.of({
            Username: username,
            Password: password,
        })
        
        @version.create(
            CredentialInstance,
            @solution,
            'POST',
            @uri,
            {}
            data
        )
      end
      
      ##
      # Constructs a CredentialContext
      def get(sid)
        CredentialContext.new(@version, sid, @solution)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Api.V2010.CredentialList>'
      end
    end
  end
end