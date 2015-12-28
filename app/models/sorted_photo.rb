class SortedPhoto < ActiveRecord::Base
  belongs_to :album, touch: true
  belongs_to :photo
end
