require "rails_helper"

describe "getHousehold query" do
  let(:household) { create(:household) }
  let(:household2) { create(:household) }
  let(:member1) { create(:member, household_id: household.id) }
  let(:member2) { create(:member, household_id: household.id) }
  let(:chore1) { create(:chore, day: 0, household_id: household.id) }
  let(:chore2) { create(:chore, day: 3, household_id: household.id) }

  before do
    MemberChore.create!(member: member1, chore: chore1)
    MemberChore.create!(member: member2, chore: chore2)
  end

  context "happy path testing" do
    it "returns a household, its members and chores" do
      result = ToDoGuruApiSchema.execute(get_household_query, variables: {
        email: household.email
      })

      expect(result.dig("data", "household", "id")).to eq(household.id.to_s)
      expect(result.dig("data", "household", "name")).to eq(household.name)
      expect(result.dig("data", "household", "members")).to be_an Array
      expect(result.dig("data", "household", "members").size).to eq(2)
      expect(result.dig("data", "household", "members", 0, "id")).to eq(member1.id.to_s)
      expect(result.dig("data", "household", "members", 0, "name")).to eq(member1.name)
      expect(result.dig("data", "household", "members", 1, "id")).to eq(member2.id.to_s)
      expect(result.dig("data", "household", "members", 1, "name")).to eq(member2.name)
      expect(result.dig("data", "household", "sunday", 0, "choreName")).to eq(chore1.name)
      expect(result.dig("data", "household", "sunday", 0, "assignedMember")).to eq(member1.name)
      expect(result.dig("data", "household", "sunday", 0, "duration")).to eq(chore1.duration)
      expect(result.dig("data", "household", "monday")).to be nil
      expect(result.dig("data", "household", "tuesday")).to be nil
      expect(result.dig("data", "household", "wednesday", 0, "choreName")).to eq(chore2.name)
      expect(result.dig("data", "household", "wednesday", 0, "assignedMember")).to eq(member2.name)
      expect(result.dig("data", "household", "wednesday", 0, "duration")).to eq(chore2.duration)
      expect(result.dig("data", "household", "thursday")).to be nil
      expect(result.dig("data", "household", "friday")).to be nil
      expect(result.dig("data", "household", "saturday")).to be nil
      expect(result.dig("data", "household", "errors")).to be nil
    end

    it "returns an empty array if there are no members for the household" do
      result = ToDoGuruApiSchema.execute(get_household_query, variables: {
        email: household2.email
      })

      expect(result.dig("data", "household", "members")).to eq([])
    end
  end

  context "sad path testing" do
    it "returns an error when the email does not match a record in the database" do
      result = ToDoGuruApiSchema.execute(get_household_query, variables: {
        email: "sample@example.com"
      })
      expect(result.dig("errors", 0, "message")).to eq("Cannot return null for non-nullable field Query.household")
    end

    it "returns an error when the email is blank" do
      result = ToDoGuruApiSchema.execute(get_household_query, variables: {
        email: ""
      })
      expect(result.dig("errors", 0, "message")).to eq("Cannot return null for non-nullable field Query.household")
    end

    it "returns an error when the email is not sent as a string" do
      result = ToDoGuruApiSchema.execute(get_household_query, variables: {
        email: 2
      })
      expect(result.dig("errors", 0, "message")).to eq("Variable $email of type String! was provided invalid value")
    end
  end

  def get_household_query
    <<-GQL
    query getHousehold($email: String!) {
      household (email: $email){
          id
          name
          members {
              id
              name
          }
          sunday {
              choreName
              assignedMember
              duration
          }
          monday {
              choreName
              assignedMember
              duration
          }
          tuesday {
              choreName
              assignedMember
              duration
          }
          wednesday {
              choreName
              assignedMember
              duration
          }
          thursday {
              choreName
              assignedMember
              duration
          }
          friday {
              choreName
              assignedMember
              duration
          }
          saturday {
              choreName
              assignedMember
              duration
          }
        }
      }
    GQL
  end
end