require 'spec_helper'

describe UsdaNutrientDatabase::SourceCode, type: :model do
  it { validate_presence_of(:code) }
  it { validate_presence_of(:description) }
end
