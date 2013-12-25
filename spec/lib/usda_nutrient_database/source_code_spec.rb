require 'spec_helper'

describe UsdaNutrientDatabase::SourceCode do
  it { validate_presence_of(:code) }
  it { validate_presence_of(:description) }
end
