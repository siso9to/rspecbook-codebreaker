class Output
    def messages
        @messages ||= []
    end

    def puts(message)
        messages << message
    end
end

def output
    @output ||= Output.new
end

Given /^the secret code is "([^"]*)"$/ do |secret|
    @game = Codebreaker::Game.new(output)
    @game.start(secret)
end

When /^I guess "([^"]*)"$/ do |guess|
    @game.guess(guess)
end

Then /^the mark should be "([^"]*)"$/ do |mark|
    output.messages.should include(mark)
end


