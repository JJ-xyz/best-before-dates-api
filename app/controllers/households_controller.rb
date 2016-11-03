class HouseholdsController < ApplicationController
  # -- ask first --before_action :authenticate
  def index
    household = Household.all

    render json: {status: 200, household: household}
  end

  def create
    user = User.find_by(username: household_params[:username])
    household = Household.new(household_params)

    household.user_id = user.id if user

    if household.save
      render json: {status: 200, household: household}
    else
      render json: {status: 422, household: household}
    end
  end

  def show
    household = Household.find(params[:id])

    render json: {status: 200, household: household}
  end

  def update
    household = Household.find(params[:id])

    household.update(household_params)

    render json: {status: 200, household: household}
  end

  # def destroy
  #
  #  household = Household.find(params[:id])
  #
  #   if household.destroy
  #     render json: {status: 204, household: household}
  #   else
  #     render json: {status: 422, household: household, error: error}
  #   end
  #
  # end

  private

  def household_params
    params.required(:household).permit(
      :name,
      :num_people
    )
  end

end
