class Mutations::CreateMember < Mutations::BaseMutation
  argument :name, String, required: true
  argument :household_id, String, required: true

  field :member, Types::MemberType, null: true
  field :errors, [String], null: false

  def resolve(name:, household_id:)
    member = Member.new(name:, household_id:)

    member.save!
    { member:, errors: [] }
    rescue StandardError => e
      { errors: [e] }
  end
end