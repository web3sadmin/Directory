module LdapManagersHelper
  def ldapadap(data,key)
    begin
      data[key].to_s.delete('"[]"')
    rescue
    end
  end

  def matching(users,ldap, match)
    users.where(:sAMAccountName => ldap.sAMAccountName.to_s.delete('"[]"')).map { |user|
      if user[match] == ldap[match].to_s.delete('"[]"')
      else
        return [%w(danger), user[match]]
      end
    }
  end
  
end
