class Api::PersonsController < ApplicationController
  before_action :set_persons, only: [:show, :update, :destroy]

  # GET /personss
  def index
    @personss = Person.all
    json_response(@personss)
  end

  # POST /persons
  def create
    @persons = Person.create!(persons_params)
    json_response(@persons, :created)
  end

  # GET /persons/:id
  def show
    json_response(@persons)
  end

  # PUT /persons/:id
  def update
    @persons.update(persons_params)
    head :no_content
  end

  # DELETE /persons/:id
  def destroy
    @persons.destroy
    head :no_content
  end

  private

  def persons_params
    # whitelist params
    params.permit(:name, :birthday ,:created_by)
  end

  def set_persons
    @persons = Person.find(params[:id])
  end
end
