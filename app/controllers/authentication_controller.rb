class AuthenticationController < ApplicationController
  before_action :set_workflow, only: [:create]
  
  def create
    if @workflow.allow? 
      render json: { jwt: @workflow.token }
    else 
      render json: { error: @workflow.error } 
    end
  end

  private 
  def auth_params
    params.require(:auth).permit(:username, :password)
  end

  def set_workflow 
    @workflow = LoginWorkflow.new(auth_params)
  end
end
