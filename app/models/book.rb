class Book < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :sub_title
  validates_presence_of :genre
  validates_presence_of :classification
  validates_presence_of :book_type
  validates_presence_of :year

  has_many :authorships
  has_many :authors, through: :authorships

  # self.authors = ["Fred ", "George"]
  # -> "Fred, George"

  def author_info
    self.authors.map(&:full_name).join(', ')
  end

  def self.book_types
    ["Fiction", "Non-fiction"]
  end

  def self.classifications
    ["General Works - encyclopedias",
    "Philosophy", "Psychology", "Religion",
    "History - Auxiliary Sciences", "History (except American)",
    "General U.S. History", "Local U.S. History",
    "Geography", "Anthropology", "Recreation",
    "Social Sciences	U", "Political Science	V",
    "Law	Z - Bibliography and Library Science",
    "Education",
    "Music",
    "Fine Arts",
    "Language and Literature",
    "Science",
    "Medicine",
    "Agriculture",
    "Technology",
    "Military",
    "Naval Science",
    "Bibliography",
    "Library Science"]
  end
end
