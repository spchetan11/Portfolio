class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      @contact = Contact.new
      respond_to do |format|
      format.js
    end
    else
      flash[:error] = 'Your message was not sent. Please try again.'
      redirect_to root_path
    end
  end
end
