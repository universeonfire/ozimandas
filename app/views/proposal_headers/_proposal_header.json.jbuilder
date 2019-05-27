json.extract! proposal_header, :id, :title, :description, :created_at, :updated_at
json.url proposal_header_url(proposal_header, format: :json)
