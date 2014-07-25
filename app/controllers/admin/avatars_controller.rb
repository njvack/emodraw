class Admin::AvatarsController < AdminController

  def experiment
    @experiment ||= Experiment.find(params[:experiment_id])
  end

  def create
    @avatar = experiment.avatars.create(avatar_params)
    if @avatar.new_record?
      render "admin/experiemnts/edit"
    else
      redirect_to edit_admin_experiment_path(experiment)
    end
  end

  protected
  def avatar_params
    params.require(:avatar).permit(:name, :uploaded_file, :active)
  end
end
