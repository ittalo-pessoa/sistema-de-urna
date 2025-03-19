class CandidaturasController < ApplicationController
  before_action :set_candidatura, only: %i[show edit update]


  def index
    @candidaturas = Candidatura.all
  end

  def show
  end

  def new
    @candidatura = Candidatura.new
  end

  def edit
  end

  def create
    @candidatura = Candidatura.new(candidatura_params)

    respond_to do |format|
      if @candidatura.save
        format.html { redirect_to @candidatura, notice: "Candidatura criada com sucesso." }
        format.json { render :show, status: :created, location: @candidatura }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @candidatura.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @candidatura.update(candidatura_params)
        format.html { redirect_to @candidatura, notice: "Candidatura atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @candidatura }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @candidatura.errors, status: :unprocessable_entity }
      end
    end
  end


  def selecionar_turma
    @turmas = Turma.all
  end

  def listar_candidatos
    @turma = Turma.find(params[:turma_id])
    @candidaturas = Candidatura.where(turma_id: @turma.id)

    if @candidaturas.empty?
      redirect_to urna_candidaturas_path, alert: "Nenhum candidato encontrado para esta turma."
    end
  end

  def registrar_voto
    if params[:voto_em_branco] == "true"
      @turma = Turma.find(params[:turma_id])
      @turma.increment!(:votos_em_branco)
      redirect_to urna_candidaturas_path, notice: "Voto em branco registrado com sucesso!"
    else
      @candidatura = Candidatura.find(params[:candidatura_id])
      @candidatura.increment!(:votos)
      redirect_to urna_candidaturas_path, notice: "Voto registrado com sucesso!"
    end
  end





  def urna
    @turma = Turma.find(params[:turma_id])
    @candidaturas = Candidatura.where(turma_id: @turma.id)

    if @candidaturas.empty?
      flash[:alert] = "Não há candidatos para esta turma."
      redirect_to selecionar_turma_candidaturas_path
    end
  end

  def registrar_voto
    if params[:candidatura_id].blank?
      # Voto em branco
      turma = Turma.find(params[:turma_id])
      turma.increment!(:votos_em_branco)
      redirect_to selecionar_turma_candidaturas_path, notice: "Voto em branco registrado com sucesso!"
    else
      # Voto em candidato
      @candidatura = Candidatura.find(params[:candidatura_id])
      @candidatura.increment!(:votos)
      redirect_to selecionar_turma_candidaturas_path, notice: "Voto registrado com sucesso!"
    end
  end


  private

  def set_candidatura
    @candidatura = Candidatura.find(params[:id])
  end

  def candidatura_params
    params.require(:candidatura).permit(:nome_candidato, :nome_urna, :turma_id, :vice_lider, :nome_urna_vice, :foto_lider, :foto_vice)
  end
end
