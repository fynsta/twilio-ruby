##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Stream' do
  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .calls('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .streams.create(url: 'https://example.com')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'Url' => 'https://example.com', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Calls/CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Streams.json',
        data: values,
    ))).to eq(true)
  end

  it "receives create_no_args responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "MZaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "name": null,
          "status": "in-progress",
          "date_updated": "Thu, 30 Jul 2015 20:00:00 +0000",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Streams/MZaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .calls('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .streams.create(url: 'https://example.com')

    expect(actual).to_not eq(nil)
  end

  it "receives create_with_args responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "MZaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "name": "myName",
          "status": "in-progress",
          "date_updated": "Thu, 30 Jul 2015 20:00:00 +0000",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Streams/MZaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .calls('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .streams.create(url: 'https://example.com')

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .calls('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .streams('MZXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(status: 'stopped')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'Status' => 'stopped', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Calls/CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Streams/MZXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json',
        data: values,
    ))).to eq(true)
  end

  it "receives update_by_sid responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "MZaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "name": null,
          "status": "stopped",
          "date_updated": "Thu, 30 Jul 2015 20:00:00 +0000",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Streams/MZaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .calls('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .streams('MZXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(status: 'stopped')

    expect(actual).to_not eq(nil)
  end

  it "receives update_by_name responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sid": "MZaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "name": "myStream",
          "status": "stopped",
          "date_updated": "Thu, 30 Jul 2015 20:00:00 +0000",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Calls/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Streams/MZaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .calls('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .streams('MZXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(status: 'stopped')

    expect(actual).to_not eq(nil)
  end
end