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

 has_many :group_relationships
 has_many :participated_groups, :through => :group_relationships, :source => :group

 has_many :groupone_relationships
 has_many :participated_groupones, :through => :groupone_relationships, :source => :groupone

 has_many :grouptwo_relationships
 has_many :participated_grouptwos, :through => :grouptwo_relationships, :source => :grouptwo

def is_member_of?(job)
  participated_jobs.include?(job)
end

def join!(job)
  participated_jobs << job
end

def quit!(job)
  participated_jobs.delete(job)
end

def is_member_of?(group)
  participated_groups.include?(group)
end

def is_member_of?(groupone)
  participated_groupones.include?(groupone)
end

def is_member_of?(grouptwo)
  participated_grouptwos.include?(grouptwo)
end
end
