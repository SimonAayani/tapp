# frozen_string_literal: true

# A class representing an applicant. This holds information regarding a student. This class
# has many preferences (a student can apply to many positions).
class Applicant < ApplicationRecord
  	has_many :assignments
  	has_many :applicant_data_for_matchings

  	validates_presence_of :first_name, :last_name, :email, :student_number, :utorid
  	validates_uniqueness_of :student_number, :utorid

    def format
    applicant = self.as_json
    excludes = [
      :address,
      :app_id,
      :commentary,
      :dept,
      :full_time,
      :yip,
    ]
    # the Liquid templating engine assumes strings instead of symbols
    return applicant.except(*excludes).with_indifferent_access
  end
end

# == Schema Information
#
# Table name: applicants
#
#  id             :bigint(8)        not null, primary key
#  email          :string           not null
#  first_name     :string           not null
#  last_name      :string           not null
#  phone          :string
#  student_number :string           not null
#  utorid         :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_applicants_on_student_number  (student_number) UNIQUE
#  index_applicants_on_utorid          (utorid) UNIQUE
#
