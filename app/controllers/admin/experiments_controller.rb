class Admin::ExperimentsController < AdminController
  before_action :find_experiment, :only => [:edit]

  def index
  end

  def new
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

  protected
  def experiment_params
    params.require(:experiment).permit(:name)
  end

  def find_experiment
    @experiment = Experiment.find(params[:id])
  end
end
