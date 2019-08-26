# frozen_string_literal: true

module Api::V1
    # Controller for ReportingTags
    class ReportingTagsController < ApplicationController

        # GET /reporting_tags
        def index
            render_success(ReportingTag.order(:id))
        end

        # POST /add_reporting_tag
        def create
            # if we passed in an id that exists, we want to update
            if params.has_key?(:id) and ReportingTag.exists?(params[:id])
                update and return
            end
            params.require([:position_id, :name])
            return if invalid_id(WageChunk, :wage_chunk_id, [])
            return if invalid_id(Position, :position_id, 
                reporting_tags_by_wage_chunk)
            reporting_tag = ReportingTag.new(reporting_tag_params)
            if reporting_tag.save # passes ReportingTag model validation
                render_success(reporting_tags_by_wage_chunk)
            else
                reporting_tag.destroy!
                render_error(reporting_tag.errors, reporting_tags_by_wage_chunk)
            end                    
        end

        def update
            reporting_tag = ReportingTag.find(params[:id])
            if reporting_tag.update_attributes!(reporting_tag_update_params)
                render_success(reporting_tag)
            else
                render_error(reporting_tag.errors)
            end
        end

        # POST /reporting_tags/delete
        def delete
            params.require(:id)
            reporting_tag = ReportingTag.find(params[:id])
            if reporting_tag.destroy!
                render_success(reporting_tag)
            else
                render_error(reporting_tag.errors.full_messages.join("; "))
            end
        end

        private
        def reporting_tag_params
            params.permit(
                :name,
                :position_id,
                :wage_chunk_id,
            )
        end

        def reporting_tag_update_params
            params.permit(
                :name,
            )
        end

        def reporting_tags_by_wage_chunk
            return ReportingTag.order(:id).each do |entry|
                entry[:wage_chunk_id] == params[:wage_chunk_id].to_i
            end
        end

    end
end
