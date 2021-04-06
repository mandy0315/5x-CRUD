class ToysController < ApplicationController
  def index
    @toys = Toy.all
  end

  def new
    @toy = Toy.new
  end

  def create
    @toy = Toy.new(toy_params)
    if @toy.save
      # 成功
      redirect_to toys_path, notice: "上傳資料成功!"
    else
      # 失敗
      render :new
    end
  end

  def edit
    @toy = Toy.find_by(id: params[:id])
    if @toy.update(toy_params)
      # 成功
      redirect_to toys_path, notice: "更新資料成功!"
    else
      # 失敗
      render :edit
    end
  end

  def destroy
    @toy = Toy.find_by(id: params[:id])
    @toy.destroy if @toy
    redirect_to toys_path, notice: "資料已刪除!"
  end

  private
  def toy_params
    params.require(:toy).permit(:name, :time, :number, :description)
  end
end
