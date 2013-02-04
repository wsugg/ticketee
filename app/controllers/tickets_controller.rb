class TicketsController < ApplicationController

 before_filter :find_project
 before_filter :find_ticket, :only => [:show, :edit, :update, :destroy]

  def flash_params(p)
    flash[:notice] = p
  end

  def new
   flash_params(params)
   @ticket = @project.tickets.build
   flash[:notice] = "#{@ticket.inspect}"
  end

  def create
   flash_params(params)
   @ticket = @project.tickets.build(params[:ticket])
    if @ticket.save
     flash[:notice] = "Ticket has been created."
     redirect_to [@project, @ticket]
    else
     flash[:alert] = "Ticket has not been created."
     render :action => "new"
    end
  end

  def show
  end

  def update
   if @ticket.update_attributes(params[:ticket])
    flash[:notice] = "Ticket has been updated."
    redirect_to [@project, @ticket]
   else
    flash[:alert] = "Ticket has not been updated."
    render :action => "edit"
   end
  end

  def edit
  end

  def destroy
  end

  private
   def find_project
    @project = Project.find(params[:project_id])
   end
   
   def find_ticket
    @ticket = @project.tickets.find(params[:id])
   end
end