class EstimatesController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show, :edit, :update, :destroy, :send_mail]

  def index
    @estimates = Estimate.order(created_at: "DESC").page(params[:page])
    #@progresses = Progress.find_by(params[:progress_id])
    #@@progresses = Estimate.progress
  end

  def new
    @estimate = Estimate.new
  end

  def confirm
    @estimate = Estimate.new(estimate_params)
  end

  def thanks
    @estimate = Estimate.new(estimate_params)
    @estimate.save
    EstimateMailer.received_email(@estimate).deliver # 管理者に通知
    EstimateMailer.send_email(@estimate).deliver # 送信者に通知
  end

  def create
    @estimate = Estimate.new(estimate_params)
    @estimate.save
    redirect_to thanks_estimates_path
  end

  def show
    @estimate = Estimate.find(params[:id])
    @comment = Comment.new
    @progress = Progress.new
  end

  def edit
    @estimate = Estimate.find(params[:id])
  end

  def destroy
    @estimate = Estimate.find(params[:id])
    @estimate.destroy
    redirect_to estimates_path, alert:"削除しました"
  end

  def update
    @estimate = Estimate.find(params[:id])
    if @estimate.update(estimate_params)
      redirect_to estimates_path(@estimate), alert: "更新しました"
    else
      render 'edit'
    end
  end

  private
  def estimate_params
    params.require(:estimate).permit(
      :name,  #名前
      :kana,  #ふりがな
      :tel, #電話番号
      :email, #メールアドレス
      :postnumber, #募集エリア
      :address, #住所
      :user_name,
      :user_password
    )
  end
end
