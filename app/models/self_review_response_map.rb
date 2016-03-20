class SelfReviewResponseMap < ResponseMap
  belongs_to :reviewee, :class_name => 'Team', :foreign_key => 'reviewee_id'
  belongs_to :assignment, :class_name => 'Assignment', :foreign_key => 'reviewed_object_id'

  def questionnaire(round)
    if self.assignment.varying_rubrics_by_round?
      Questionnaire.find(self.assignment.get_review_questionnaire_id(round))
    else
      Questionnaire.find(self.assignment.get_review_questionnaire_id)
    end
  end

  def contributor
    nil
  end

  def get_title
    return "Self Review"
  end
end
