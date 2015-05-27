class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :entries
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  validates :major,:name, :univercity,              presence: true ,          on: :update
  has_one :profile


def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        name: auth.extra.raw_info.name,
        provider: auth.provider,
        email:    auth.extra.raw_info.email,
        image: auth.info.image,
        gender: auth.extra.raw_info.gender,
        fburl: auth.info.urls[:Facebook],
        password: Devise.friendly_token[0, 20]  
      )

    end

    user
  end

    # providerがある場合（facebook経由で認証した）は、
  # passwordは要求しないようにする。
  def password_required?
    super && provider.blank?
  end


  # allow users to update their accounts without passwords
  def update_without_current_password(params, *options)
    params.delete(:current_password)
 
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
 
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end



  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end


end
