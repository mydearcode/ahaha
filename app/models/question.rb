class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true
  validate :question_award




  private 

  def question_award
    
  
    user = User.find(self.user_id)
    if user.budget < self.award 
    errors.add(:tempreward, 'Your Budget or  limit(min:10) is not enough to submit')
    
    elsif self.award < 1
    errors.add(:award, 'You have to define Reward per user(min = 10 )')    
    end
    
  end








end
