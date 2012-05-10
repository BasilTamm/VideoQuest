class Video < ActiveRecord::Base
  attr_accessible :user_id, :path, :about
  has_many :comments #dependent: :destroy
  belongs_to :user
  
  validates_presence_of :user
  validates_presence_of :path
    
  mount_uploader :path, VideoUploader
  
  def transcode_flv
    IO.popen("ffmpeg -y -i #{[Rails.root,'/public', self.path.to_s].join} -ar 11025 -f flv #{['public', self.path.to_s, ".flv"].join}")
  end
end
