class Post < ApplicationRecord
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    
    belongs_to :user

    def self.search(search)
        if search
            search.downcase! # same as search = search.downcase
            where("lower(title) LIKE ?", "%#{search}%")
        else
            all
        end
    end
end
