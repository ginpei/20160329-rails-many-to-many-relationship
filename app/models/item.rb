class Item < ActiveRecord::Base
  has_and_belongs_to_many :tags

  def other_tags
    other_tags = []
    Tag.all.each do |tag|
      unless tags.include?(tag)
        other_tags.push tag
      end
    end
    other_tags
  end

  def update_tags(selected_tag_ids)
    selected_tag_ids = [] unless selected_tag_ids

    # remove
    tags.each do |tag|
      tags.delete(tag) unless selected_tag_ids.include? tag.id
    end

    # add
    selected_tag_ids.each do |tag_id|
      tags << Tag.find(tag_id)
    end
  end
end
