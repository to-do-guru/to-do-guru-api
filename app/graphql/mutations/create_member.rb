class Mutations::CreateMember < Mutations::BaseMutation
  argument :name, String, required: true
  argument :household_id, String, required: true

  field :member, Types::MemberType, null: true
  field :errors, [String], null: false

  def resolve(name:, household_id:)
    member = Member.new(name: name, household_id: household_id)

    member.save!
      { member: member, errors: [] }

    rescue => e
      return { errors: [e] }
  end
end