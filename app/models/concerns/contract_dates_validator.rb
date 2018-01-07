class ContractDatesValidator < ActiveModel::Validator
  def validate(record)
    if record.ends_on && record.starts_on && (record.ends_on < record.starts_on)
      record.errors.add(:ends_on, "Contract's end date must not be greater than start date")
    end
  end
end
