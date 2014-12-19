class UploadCtrlController < ApplicationController
	def index
     render :file => 'app\views\upload_ctrl\uploadfile.rhtml'
  end
  def uploadFile
    post = DataFile.save(params[:upload])
    render :text => "File has been uploaded successfully"
  end
end
