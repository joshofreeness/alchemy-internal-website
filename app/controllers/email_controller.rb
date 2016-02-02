class EmailController < ApplicationController

    def new
        render 'new'
    end

    def create
        from = current_user.email
        to = params[:email][:to]
        subject = params[:email][:subject]
        body = params[:email][:body]
        puts 'params =================================='
        puts params.inspect
        unless params[:product_id].nil?
            p = Product.find(params[:product_id])
            mail = AlchemyMailer.send_with_attachment(from, to, subject, body, p.sds, p.absolute_documents_path.join(p.sds))
        else
            mail = AlchemyMailer.send_full_email(from, to, subject, body)
        end
        mail.deliver!

        flash.now[:notice] = "Email sent successfully!"
        render :new
    end

end
