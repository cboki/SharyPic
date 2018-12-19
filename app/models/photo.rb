class Photo < ApplicationRecord
  #require "google/cloud/vision"
  belongs_to :event
  belongs_to :user
  has_many :photo_tags
  has_many :tags, through: :photo_tags
  has_many :comments, as: :commentable
  has_many :likes

  validates :file, :event, presence: true

  #after_create :add_google_tags

  private

  def add_google_tags

    image_annotator = Google::Cloud::Vision::ImageAnnotator.new
    response = image_annotator.label_detection(image: file)
    response.responses.each do |res|
      res.label_annotations.each do |label|
        in_tabel = Tag.find_by(name: label.description)
        if in_tabel.nil?
          @tag = Tag.new
          @tag.name = label.description
          @tag.save!
        end
        tag = Tag.find_by(name: label.description)
        @photo_tag = PhotoTag.create!(
          tag: tag,
          photo: self
        )
      end
    end
  end
end
