class StudentlistsController < ApplicationController
    def create
      @studentlist = Studentlist.new studentlist_params
      @studentlist.save

      redirect_to classroom_path(@studentlist.classroom)
    end

    def update

    end

    private
      # @studentlist.user_id = params[:user_id]
      # @studentlist.classroom_id = params[:classroom_id]
      def studentlist_params
        params.require(:studentlist).permit(:classroom_id, :user_id)
      end
end
