class DashboardController < ApplicationController
  before_action :set_workflow, only: [:index]
  
  def index
    if @workflow.allow?
      render json: { success: "Welcome to dashboard, #{@workflow.user.username}" }
    else 
      render json: { error: @workflow.error }
    end
  end

  def set_workflow
    @workflow = DashboardWorkflow.new(auth_header: request.authorization)
  end
end
