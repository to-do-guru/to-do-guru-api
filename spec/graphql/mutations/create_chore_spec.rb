require "rails_helper"

RSpec.describe "Mutation Create Chore" do
  let!(:household) { Household.create(name: "Test Household") }
  it "creates a chore by returning the chore" do
    query = <<~GQL
      mutation{#{' '}
        createChore(input:{
          householdId: #{household.id}
          name: "Fold Clothes"
          duration: 30
          day: ["Sunday", "Thursday"]
        })
        {
        chores{
          choreName
           }
          errors
          }
       }
    GQL

    result = ToDoGuruApiSchema.execute(query)

    expect(result.dig("data", "createChore", "chores").length).to eq(2)
    expect(result.dig("data", "createChore", "chores").first["choreName"]).to eq("Fold Clothes")
    expect(result.dig("data", "createChore", "chores").last["choreName"]).to eq("Fold Clothes")
  end

  it "returns an error if chore name is not given " do
    query = <<~GQL
      mutation{#{' '}
        createChore(input:{
          householdId: #{household.id}
          name: ""
          duration: 30
          day: ["Sunday", "Thursday"]
        })
        {
        chores{
          choreName
           }
          errors
          }
       }
    GQL

    result = ToDoGuruApiSchema.execute(query)

    expect(result.dig("data", "createChore", "errors").first).to eq("[\"Name can't be blank\"]")
  end

  it "returns an error when the duration is not given" do
    query = <<~GQL
      mutation{#{' '}
        createChore(input:{
          householdId: #{household.id}
          name: "Dishes"
          duration: null
          day: ["Sunday", "Thursday"]
        })
        {
        chores{
          choreName
           }
          errors
          }
       }
    GQL

    result = ToDoGuruApiSchema.execute(query)

    expect(result.to_h["errors"].first["message"]).to eq("Argument 'duration' on InputObject 'CreateChoreInput' has an invalid value (null). Expected type 'Int!'.")
  end

  it "returns an error when the day is not given" do
    query = <<~GQL
      mutation{#{' '}
        createChore(input:{
          householdId: #{household.id}
          name: "Dishes"
          duration: 30
          day: null
        })
        {
        chores{
          choreName
           }
          errors
          }
       }
    GQL

    result = ToDoGuruApiSchema.execute(query)

    expect(result.to_h["errors"].first["message"]).to eq("Argument 'day' on InputObject 'CreateChoreInput' has an invalid value (null). Expected type '[String!]!'.")
  end
end
