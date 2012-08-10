#################
#
# Formotion::RowCellBuilder
# RowCellBuilder handles taking Formotion::Rows
# and configuring UITableViewCells based on their properties.
#
#################
module Formotion
  class RowCellBuilder

    # PARAMS row.is_a? Formotion::Row
    # RETURNS [cell configured to that row, a UITextField for that row if applicable or nil]
    def self.make_cell(row)
      cell, text_field = nil

      cell = FormotionTableViewCell.alloc.initWithStyle(row.object.cell_style, reuseIdentifier:row.reuse_identifier)

      cell.accessoryType = cell.editingAccessoryType = UITableViewCellAccessoryNone
      cell.textLabel.text = row.title
      cell.detailTextLabel.text = row.subtitle

      edit_field = row.object.build_cell(cell)

      [cell, edit_field]
    end

  end

  # Currently a thin wrapper over UITableViewCell
  # This allows for proper highlighting behavior on selection
  class FormotionTableViewCell < UITableViewCell

    def initWithStyle(style, reuseIdentifier:reuse_identifier)
      super

      self
    end

    def setHighlighted(highlighted, animated:animated)
      super
      # relying on this hack since there's no nice way to get the text view right now
      text_view_tag = Formotion::RowType::TextRow.const_get("TEXT_VIEW_TAG")
      text_view = self.viewWithTag(text_view_tag)

      default_color = Formotion::RowType::Base.const_get("DEFAULT_TEXT_COLOR")
      if text_view && self.selectionStyle != UITableViewCellSelectionStyleNone
        animation = lambda { text_view.textColor = highlighted ? UIColor.whiteColor : default_color }
        if animated
          UIView.animateWithDuration(0.5, animations:animation)
        else
          animation.call
        end
      end
    end

  end

end