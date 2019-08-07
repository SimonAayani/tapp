# frozen_string_literal: true

# A class representing an offer. This class belongs to assignment, applicant and position.
class Offer < ApplicationRecord
  	belongs_to :assignment
end

# == Schema Information
#
# Table name: offers
#
#  id                      :bigint(8)        not null, primary key
#  accepted_date           :datetime
#  email                   :string
#  emailed_date            :datetime
#  first_name              :string
#  first_time_ta           :boolean
#  installments            :integer
#  instructor_contact_desc :string
#  last_name               :string
#  nag_count               :integer          default(0)
#  offer_override_pdf      :string
#  offer_template          :string
#  pay_period_desc         :string
#  position_code           :string
#  position_end_date       :datetime
#  position_start_date     :datetime
#  position_title          :string
#  rejected_date           :datetime
#  signature               :string
#  ta_coordinator_email    :string
#  ta_coordinator_name     :string
#  withdrawn_date          :datetime
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  assignment_id           :bigint(8)
#
# Indexes
#
#  index_offers_on_assignment_id  (assignment_id)
# Offer.create({assignment_id: 1, first_name: "Simon",last_name: "Aayani",email: "simon.aayani@mail.utoronto.ca",position_title: "Teaching Assistant",position_start_date: Date(),position_end_date: Date(),first_time_ta: "True",status: "Pending",nag_count: 1})
# Offer.create({assignment_id: 1, first_name: "Simon",last_name: "Aayani",email: "simon.aayani@mail.utoronto.ca",position_title: "Teaching Assistant",first_time_ta: "True",nag_count: 1})
