class AuthenticationController < ApplicationController
  def create
    @workflow = LoginWorkflow.new(username: params[:auth][:username], password: params[:auth][:password])

    if @workflow.allow? 
      render json: { jwt: @workflow.token }
    else 
      render json: { error: @workflow.error } 
    end
  end
end
