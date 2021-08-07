class SmtpConfigsController < ApplicationController
  authorize_resource
  
  before_action :authenticate_user!
  before_action :set_smtp_config, only: [:show, :edit_smtp_config, :edit, :update, :destroy]

  layout "dashboard"

  # GET /smtp_configs
  # GET /smtp_configs.json
  def index
    @smtp_config = SmtpConfig.first
  end

  # GET /smtp_configs/1
  # GET /smtp_configs/1.json
  def smtp_configs
    @smtp_config = SmtpConfig.first
  end

  # GET /smtp_configs/new
  def new
    @smtp_config = SmtpConfig.new
  end

  def new_smtp_config
    @smtp_config = SmtpConfig.new
  end

  # GET /smtp_configs/1/edit
  def edit
  end

  
  # POST /smtp_configs
  # POST /smtp_configs.json
  def create
    @smtp_config = SmtpConfig.new(smtp_config_params)

    respond_to do |format|
      if @smtp_config.save
        format.html { redirect_to @smtp_config, notice: 'smtp Config was successfully created.' }
        format.json { render :show, status: :created, location: @smtp_config }
        format.js
      else
        format.html { render :new }
        format.json { render json: @smtp_config.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /smtp_configs/1
  # PATCH/PUT /smtp_configs/1.json
  def update
    respond_to do |format|
      if @smtp_config.update(smtp_config_params)
        format.html { redirect_to @smtp_config, notice: 'Smtp config was successfully updated.' }
        format.json { render :show, status: :ok, location: @smtp_config }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @smtp_config.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /smtp_configs/1
  # DELETE /smtp_configs/1.json
  def destroy
    @smtp_config.destroy
    respond_to do |format|
      format.html { redirect_to smtp_configs_url, notice: 'Smtp config was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smtp_config
      @smtp_config = SmtpConfig.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def smtp_config_params
      params.require(:smtp_config).permit(:smtp_user_name, :smtp_user_password,  :smtp_address, :smtp_domain, :smtp_port, :smtp_authentification, :smtp_enable_starttls_auto, :smtp_ssl)
    end
end
