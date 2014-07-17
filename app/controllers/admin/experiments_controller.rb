class Admin::ExperimentsController < AdminController

  def experiments
    @experiments ||= Experiment.all
  end
  helper_method :experiments

  def experiment
    @experiment ||= Experiment.find(params[:id])
  end
  helper_method :experiment

  def index
  end

  def new
    @experiment = Experiment.new
  end

  def edit
  end

  def create
    @experiment = Experiment.create(experiment_params)
    if @experiment.new_record?
      render new_experiment_path
    else
      redirect_to edit_admin_experiment_path(@experiment)
    end
  end

  def update
    if experiment.update_attributes(experiment_params)
      redirect_to edit_admin_experiment_path(experiment)
    else
      render :action => 'edit'
    end
  end

  protected
  def experiment_params
    params.require(:experiment).permit(:name)
  end
end
