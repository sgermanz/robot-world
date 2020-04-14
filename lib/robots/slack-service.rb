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