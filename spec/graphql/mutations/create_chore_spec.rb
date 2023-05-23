require "rails_helper"

RSpec.describe "Mutation Create Chore" do
  let!(:household) { Household.create(name: "Test Household") }
  it "creates a chore by returning the chore" do
    input = <<~GQL
    {
      householdId: #{household.id}
      name: "Fold Clothes"
      duration: 30
      day: ["Sunday", "Thursday"]
    }
    GQL

    result = ToDoGuruApiSchema.execute(query(input))

    expect(result.dig("data", "createChore", "chores").length).to eq(2)
    expect(result.dig("data", "createChore", "chores").first["choreName"]).to eq("Fold Clothes")
    expect(result.dig("data", "createChore", "chores").last["choreName"]).to eq("Fold Clothes")
  end

  it "returns an error if a non-existent household ID is given" do
    input = <<~GQL
    {
      householdId: 0
      name: "Dishes"
      duration: 30
      day: ["Sunday", "Thursday"]
    }
    GQL

    result = ToDoGuruApiSchema.execute(query(input))

    expect(result.dig("data", "createChore", "errors").first).to eq("Validation failed: Household must exist")
  end

  it "returns an error if chore name is not given" do
    input = <<~GQL
    {
      householdId: #{household.id}
      name: ""
      duration: 30
      day: ["Sunday", "Thursday"]
    }
    GQL

    result = ToDoGuruApiSchema.execute(query(input))

    expect(result.dig("data", "createChore", "errors").first).to eq("Validation failed: Name can't be blank")
  end

  it "returns an error when the duration is not given" do
    input = <<~GQL
    {
      householdId: #{household.id}
      name: "Dishes"
      duration: null
      day: ["Sunday", "Thursday"]
    }
    GQL

    result = ToDoGuruApiSchema.execute(query(input))

    expect(result.to_h["errors"].first["message"]).to eq("Argument 'duration' on InputObject 'CreateChoreInput' has an invalid value (null). Expected type 'Int!'.")
  end

  it "returns an error when the day is not given" do
    input = <<~GQL
    {
      householdId: #{household.id}
      name: "Dishes"
      duration: 30
      day: null
    }
    GQL

    result = ToDoGuruApiSchema.execute(query(input))

    expect(result.to_h["errors"].first["message"]).to eq("Argument 'day' on InputObject 'CreateChoreInput' has an invalid value (null). Expected type '[String!]!'.")
  end
end

def query(input)
  query = <<~GQL
  mutation{
    createChore(input:#{input})
    {
    chores{
      choreName
       }
      errors
      }
   }
  GQL
end
