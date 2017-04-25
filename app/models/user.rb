class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
def admin?
 is_admin
end
has_many :jobs
has_many :job_relationships
has_many :participated_jobs, :through => :job_relationships, :source => :job
has_many :resumes

def is_member_of?(job)
  participated_jobs.include?(job)
end
end
