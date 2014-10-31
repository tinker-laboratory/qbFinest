class Company
  
  def self.company_info(realm_id)
    QBfinest.configuration.access_token.get('https://sandbox-quickbooks.api.intuit.com/v3/company/1292677230/companyinfo/1292677230', {'Accept' => 'application/json'})

  end
end
