class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #relations
  has_one  :profile
  has_many :posts
  has_many :messages, through: :postable, :class_name => "Post"

  has_many :memberships
  has_many :groups, through: :memberships

  has_many :affiliations
  has_many :affiliates, through: :affiliations

  has_many :inverse_affiliations, :class_name =>  "Affiliation", :foreign_key => "affiliate_id"
  has_many :inverse_affiliates, :through => :inverse_affiliations, :source => :user

  before_validation :normalize_number
  validates :phone_number, :phony_plausible => true, :if => :has_number

  #validations
  after_create :create_profile

  def projects
    return self.groups.where(:group_type=>'Project')
  end

  def organizations
    return self.groups.where(:group_type=>'Organization')
  end

  def communities
    return self.groups.where(:group_type=>'Community')
  end

  def group_conversations
    @groups = self.groups
    @conversations = []
    @groups.each do |g|
      g.conversations.each do |c|
        @conversations << c
      end
    end

    @conversations
  end

  def personal_conversations
    self.posts.where(:postable.instance_of?(User), message_type: "conversation")
  end

  def private_message
    self.posts.where(type: "private_message")
  end

  def has_number
    !self.phone_number.nil?
  end


  private

    def create_profile
      @profile = Profile.create
      @profile.user = self
      self.profile = @profile
    end


    def normalize_number
      if not self.phone_number.nil? then
        self.phone_number.phony_formatted!(:format => :international, :normalize => self.country, :spaces => '')
      end
    end

end
