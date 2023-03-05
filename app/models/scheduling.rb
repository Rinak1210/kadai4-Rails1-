class Scheduling < ApplicationRecord
  
  validates :title, presence:true, length: {maximum:20}
  validates :start_date, presence:true
  validates :end_date, presence:true
  validates :memo, length: {maximum:500}
  validate :date_check

  def date_check
    return if start_date.blank? || end_date.blank?
    errors.add(:end_date, "(終了日)は開始日以降のものを選択してください" )if end_date < start_date
  end
  
end
