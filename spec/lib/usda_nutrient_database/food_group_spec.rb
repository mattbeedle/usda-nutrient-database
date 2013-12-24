require 'spec_helper'

describe UsdaNutrientDatabase::FoodGroup do
  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:description) }
end
