Ransack.configure do |config|
  config.add_predicate 'lteq_to_date',
    arel_predicate: 'lteq',
    formatter: proc { |v| v.to_date },
    type: :date
    
  config.add_predicate 'gteq_to_date',
    arel_predicate: 'gteq',
    formatter: proc { |v| v.to_date },
    type: :date
end
