class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:flash] = 'Thank you for your message. We will contact you soon!'
      redirect_to root_path, notice: 'Successfully sent'  
    else
      flash[:error] = 'Cannot send message.'
      redirect_to root_path
    end
  end
end
