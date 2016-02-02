class AlchemyMailer < ActionMailer::Base
    default from: "alchemy-internal@alchemyagencies.co.nz"

    def send_email(recipient_email)
        mail(to: recipient_email, subject: "Test email", body: "Test body")
    end

    def send_full_email(from, to, subject, body)
        mail(from: from, to: to, subject: subject, body: body)
    end
end
