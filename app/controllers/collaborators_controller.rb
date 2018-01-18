class CollaboratorsController < ApplicationController

  def create
    @collaborator = Collaborator.new(collaborator_params)
    @wiki = Wiki.find_by(id: params[:collaborator][:wiki_id])
    @user = User.find(params[:collaborator][:user_id])

    if @collaborator.save
      flash[:notice] = "Collaborator added!"
      redirect_to @wiki
    else
      flash[:error] = "Collaborator was not added. Please try again."
      render :show
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "You have removed this collaborator."
      redirect_to @collaborator.wiki
    else
      flash[:error] = "There was an error. Please try again."
      redirect_to @collaborator.wiki
    end
  end

  private
  def collaborator_params
    params.require(:collaborator).permit(:user_id, :wiki_id)
  end

end
