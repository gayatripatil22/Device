class HomeController < ApplicationController
    def index
    end
    def show
       @q = User.ransack(params[:q])
       @users = @q.result.page(params[:page]).per(10)
    end
end
