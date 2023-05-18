class Mutations::CreateMember < Mutations::BaseMutation
  argument :name, String, required: true
  argument :household_id, String, required: true

  field :member, Types::MemberType, null: false
  field :errors, [String], null: false

  def resolve(name:, household_id:)
    member = Member.new(name: name, household_id: household_id)
    binding.pry
    if member.save
      {
        member: member,
        errors: []
      }
    else member.name.blank?
      {
        member: nil,
        errors: ["Name can't be blank"]
      }
    # else 
    #   {
    #     member: nil,
    #     errors: member.errors.full_messages
    #   }
    end
  end
end