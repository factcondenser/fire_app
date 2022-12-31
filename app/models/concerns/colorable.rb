module Colorable
  extend ActiveSupport::Concern

  COLORS = [
    DEFAULT_BACKGROUND_COLOR = WHITE = '#ffffff'.freeze,
    DEFAULT_FOREGROUND_COLOR = BLACK = '#000000'.freeze
  ].freeze

  FORMAT_REGEX = '\A#[a-f0-9]{2}[a-f0-9]{2}[a-f0-9]{2}\Z'.freeze

  included do
    include HasDefaultValues

    defaults :background_color, to: DEFAULT_BACKGROUND_COLOR
    defaults :foreground_color, to: DEFAULT_FOREGROUND_COLOR

    validates :background_color, presence: true, format: { with: /#{FORMAT_REGEX}/ }
    validates :foreground_color, presence: true, format: { with: /#{FORMAT_REGEX}/ }
  end
end
