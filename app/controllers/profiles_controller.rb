class ProfilesController < ApplicationController
 
  def index
    @profile = Profile.new 
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.valid?
      @profile.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:postal_code, :region_id, :municipality, :address, :building_name, :telephone_number)
  end

end
