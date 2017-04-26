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

 has_many :groups
 has_many :groupones
 has_many :grouptwos

 has_many :essays
 has_many :essayones
 has_many :essaytwos

def is_member_of?(job)
  participated_jobs.include?(job)
end

def join!(job)
  participated_jobs << job
end

def quit!(job)
  participated_jobs.delete(job)
end
end
