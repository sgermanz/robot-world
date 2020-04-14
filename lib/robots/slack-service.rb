require 'net/http'
class SlackService
    @channel = "https://hooks.slack.com/services/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"
    def self.sendMessage(message)
        if !(Rails.env == "test")
            message = {"text": message}
            puts Net::HTTP.post URI(@channel),
            message.to_json,
            "Content-Type" => "application/json"
        end
    end
end