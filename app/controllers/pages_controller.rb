class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :edit, :update, :destroy]
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  layout "dashboard"

  add_breadcrumb "Accueil", :root_path

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    render layout: "front"
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  def about_us 
    @page = Page.find_by(title: "A propos")
    add_breadcrumb @page.title, about_us_path
    @page_title = @page.title
    @page_description = @page.content
    @page_keywords    = 'Qui sommes nous?, à propos de nous, présentation'
    render layout: "front"
  end

  def cgu
    @page = Page.find_by(title: "Conditions Générales d'Utilisation")
    add_breadcrumb @page.title, cgu_path
    @page_description = @page.content
    @page_keywords    = "CGU, Conditions Générales d'Utilisation, Termes du contrat d'utilisation"
    render layout: "front"
  end

  def contact 
    @contact_form = ContactForm.new
    add_breadcrumb "Contact", contact_path
    @page_description = "Vous pouvez utiliser le formulaire ci-dessous pour nous contacter. 
    Que ce soit pour des commentaires, des suggestions, 
    pour un problème, simplement pour avoir de l'information ou de l'aide. "
    @page_keywords    = 'Nous rejoindre, Notre equipe, nous contacter, contactez-nous'
    render layout: "front"
  end

  def join_us
    @page = Page.find_by(title: "Rejoignez-nous")
    add_breadcrumb @page.title, join_us_path
    @page_title = @page.title
    @page_description = @page.content
    @page_keywords    = 'Nous rejoindre, Notre equipe'
    render layout: "front"
  end

  def how_it_work
    @page = Page.find_by(title: "Comment ça marche")
    add_breadcrumb @page.title, how_it_work_path
    @page_title = @page.title
    @page_description = @page.content
    @page_keywords    = 'Comment ça marche'
    render layout: "front"
  end

  def partenaires
    @page = Page.find_by(title: "Partenaires")
    add_breadcrumb @page.title, partnaires_path
    @page_title = @page.title
    @page_description = @page.content
    @page_keywords    = 'Nos partenaires, dévenir partenaire'
    render layout: "front"
  end

  def advertise
    @page = Page.find_by(title: "Publicité")
    add_breadcrumb @page.title, advertise_path
    @page_title = @page.title
    @page_description = @page.content
    @page_keywords    = 'Publicité, faire une publicité'
    render layout: "front"
  end

  def privacy_policy
    @page = Page.find_by(title: "Politiques de traitement et de protection des données personnelles")
    add_breadcrumb @page.title, privacy_policy_path
    @page_title = @page.title
    @page_description = @page.content
    @page_keywords    = ''
    render layout: "front"
  end

  def robots
    respond_to :text
  end

  def ads
    respond_to :text
  end


  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = current_user.pages.build(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to pages_path, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end


  def delete
    @page = Page.friendly.find(params[:page_id])
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to pages_path, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def page_params
      params.require(:page).permit(:title,  :content, :status)
    end
end
