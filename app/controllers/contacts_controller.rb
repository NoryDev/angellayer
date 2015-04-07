class ContactsController < ApplicationController
  skip_before_action :authenticate
  skip_before_action :founder_not_authorized
  skip_before_action :investor_not_authorized

  def send_contact
    params = contact_params

    ContactMailer.contact(params).deliver

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Your message has been sent, thanks!" }
      format.js
    end
  end

  def flag
    @params = flag_params

    ContactMailer.flag(@params).deliver

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Your report has been sent, thanks!" }
      format.js
    end
  end

  def claim
    @params = claim_params

    ContactMailer.claim(@params).deliver

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Your request has been sent, thanks!" }
      format.js
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:resource).permit(:email, :name, :subject, :message)
    end

    def flag_params
      params.require(:resource).permit(:email, :name, :eval_id, :like_not, :spam, :insulting, :message)
    end

    def claim_params
      params.require(:resource).permit(:email, :profile_id, :message)
    end
end
