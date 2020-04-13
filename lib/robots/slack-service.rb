require 'net/http'
class SlackService
    @channel = "https://hooks.slack.com/services/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"
    def self.sendMessage
        message = {"text": "This is a test"}
        puts Net::HTTP.post URI(@channel),
        message.to_json,
        "Content-Type" => "application/json"
    end
end