class BopSubject < ApplicationRecord

  has_many :bop_details, dependent: :destroy
  belongs_to :account_book_params
  
  def save_detail(sent_details)
    self.bop_details << sent_details
    current_details = self.details.pluck(:name) unless self.details.nil?
    old_details = current_details - sent_details
    new_details = sent_details - current_details

    old_details.each do |old|
      self.details.delete　Detail.find_by(name: old)
    end

    new_details.each do |new|
      new_post_detail = Detail.find_or_create_by(name: new)
      self.details << new_post_detail
    end
  end
end
