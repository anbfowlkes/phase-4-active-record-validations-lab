class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }

    # validate :cat_validator
    
    # def cat_validator
    #     if category == "Fiction" || category == "Non-Fiction"
    #         return
    #     else
    #         return errors.add(:category, "is not included in the list")
    #     end
    # end

    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

    validate :check_title

    def check_title
        if /Won't Believe/i.match?(title) || /Secret/i.match?(title) || /Top \d/i.match?(title) || /Guess/i.match?(title)
            return
        else
            errors.add(:title, "must be clickbait")
        end
    end

end
