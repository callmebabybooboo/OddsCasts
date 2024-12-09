class Article < ApplicationRecord
    has_one_attached :cover_url
    has_one :content, as: :contentable
    accepts_nested_attributes_for :content
end
