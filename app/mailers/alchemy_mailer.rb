class AlchemyMailer < ActionMailer::Base
    default from: "alchemy-internal@alchemyagencies.co.nz"

    def send_email(recipient_email)
        mail(to: recipient_email, subject: "Test email", body: "Test body")
    end

    def send_full_email(from, to, subject, body)
        mail(from: from, to: to, subject: subject, body: body, content_type:  "text/html")
    end

    def send_with_attachment(from, to, subject, body, attachment_name, attachment_path)
        attachments[attachment_name] = File.read(attachment_path)
	@body = body
        mail(from: from, to: to, subject: subject ) do |format|
		format.html { render layout: 'send_full_email' }
	end
    end
end
